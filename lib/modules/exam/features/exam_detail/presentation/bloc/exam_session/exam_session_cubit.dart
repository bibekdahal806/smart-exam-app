import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

part 'exam_session_state.dart';

class ExamSessionCubit extends Cubit<ExamSessionState> {
  final RemoteExamRepository remoteRepository = getIt<RemoteExamRepository>();
  final LocalExamSessionRepository localRepository =
      getIt<LocalExamSessionRepository>();
  Timer? _ticker;

  ExamSessionCubit() : super(const ExamSessionState());

  Future<void> startOrResume(
    ExamEntity exam, {
    ExamSessionEntity? initialSession,
  }) async {
    emit(
      state.copyWith(
        status: ExamSessionStatus.loading,
        exam: exam,
        error: null,
      ),
    );

    try {
      final examId = (exam.id ?? '').trim();
      if (examId.isEmpty) {
        emit(
          state.copyWith(
            status: ExamSessionStatus.failure,
            error: 'Exam id is missing.',
          ),
        );
        return;
      }

      final existing =
          initialSession ?? await localRepository.getSession(examId);
      final session = existing ?? _createNewSession(exam);
      final resolvedExam = existing?.exam ?? exam;

      final map = _resultsToMap(session.results);
      final remainingSeconds = session.remainingSecondsAt(DateTime.now());

      if (session.isTimed && remainingSeconds == 0 && !session.isSubmitted) {
        emit(
          state.copyWith(
            status: ExamSessionStatus.expired,
            exam: resolvedExam,
            session: session,
            answersByQuestionId: map,
            currentIndex: _safeIndex(
              resolvedExam.questions.length,
              session.currentIndex,
            ),
            remainingSeconds: 0,
            autoSubmitted: false,
          ),
        );
        await submit(autoSubmitted: true);
        return;
      }

      emit(
        state.copyWith(
          status: session.isSubmitted
              ? ExamSessionStatus.submitted
              : ExamSessionStatus.ready,
          exam: resolvedExam,
          session: session,
          answersByQuestionId: map,
          currentIndex: _safeIndex(
            resolvedExam.questions.length,
            session.currentIndex,
          ),
          remainingSeconds: remainingSeconds,
          autoSubmitted: false,
        ),
      );

      await localRepository.saveSession(session.copyWith(exam: resolvedExam));

      _startTicker();
    } catch (e) {
      emit(
        state.copyWith(
          status: ExamSessionStatus.failure,
          error: AppErrorHandler.getErrorMessage(e),
        ),
      );
    }
  }

  ExamSessionEntity _createNewSession(ExamEntity exam) {
    final now = DateTime.now();
    return ExamSessionEntity(
      examId: exam.id!.trim(),
      exam: exam,
      currentIndex: 0,
      startedAt: now,
      updatedAt: now,
      expiresAt: exam.isTimed
          ? now.add(Duration(seconds: exam.durationSeconds!))
          : null,
      results: ExamAnswerUtils.normalizeResults(
        questions: exam.questions,
        answersByQuestionId: const {},
      ),
    );
  }

  Map<String, List<String>> _resultsToMap(List<QuestionResultEntity> results) {
    return {
      for (final result in results)
        result.questionId: List<String>.from(result.answers),
    };
  }

  int _safeIndex(int length, int index) {
    if (length <= 0) return 0;
    if (index < 0) return 0;
    if (index >= length) return length - 1;
    return index;
  }

  Future<void> updateAnswer({
    required String questionId,
    required List<String> answers,
  }) async {
    if (state.session == null) return;
    final nextMap = Map<String, List<String>>.from(state.answersByQuestionId);
    nextMap[questionId] = answers;
    final nextSession = state.session!.copyWith(
      updatedAt: DateTime.now(),
      results: ExamAnswerUtils.normalizeResults(
        questions: state.exam.questions,
        answersByQuestionId: nextMap,
      ),
    );
    emit(state.copyWith(answersByQuestionId: nextMap, session: nextSession));
    await localRepository.saveSession(nextSession);
  }

  Future<void> goToIndex(int index) async {
    if (state.session == null) return;
    final nextIndex = _safeIndex(state.totalQuestions, index);
    final nextSession = state.session!.copyWith(
      currentIndex: nextIndex,
      updatedAt: DateTime.now(),
    );
    emit(state.copyWith(currentIndex: nextIndex, session: nextSession));
    await localRepository.saveSession(nextSession);
  }

  Future<void> nextQuestion() => goToIndex(state.currentIndex + 1);
  Future<void> previousQuestion() => goToIndex(state.currentIndex - 1);

  Future<void> syncClock() async {
    if (state.session == null || !state.isTimed) return;
    final remaining = state.session!.remainingSecondsAt(DateTime.now());
    if (remaining != state.remainingSeconds) {
      emit(state.copyWith(remainingSeconds: remaining));
    }
    if (remaining == 0 &&
        state.status != ExamSessionStatus.submitting &&
        state.status != ExamSessionStatus.submitted) {
      await submit(autoSubmitted: true);
    }
  }

  void _startTicker() {
    _ticker?.cancel();
    if (!state.isTimed) return;
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      syncClock();
    });
  }

  Future<void> submit({bool autoSubmitted = false}) async {
    if (state.session == null) return;
    if (state.status == ExamSessionStatus.submitting ||
        state.status == ExamSessionStatus.submitted) {
      return;
    }

    emit(state.copyWith(status: ExamSessionStatus.submitting, error: null));
    try {
      final now = DateTime.now();
      final finalSession = state.session!.copyWith(
        updatedAt: now,
        isSubmitted: true,
        submittedAt: now,
        results: state.results,
      );

      await remoteRepository.submitExam(
        examId: state.exam.id!,
        startedAt: finalSession.startedAt,
        submittedAt: now,
        answers: finalSession.results,
        durationSeconds: state.exam.durationSeconds,
        autoSubmitted: autoSubmitted,
      );

      await localRepository.deleteSession(state.exam.id!);
      _ticker?.cancel();
      emit(
        state.copyWith(
          status: autoSubmitted
              ? ExamSessionStatus.expired
              : ExamSessionStatus.submitted,
          session: finalSession,
          autoSubmitted: autoSubmitted,
          remainingSeconds: state.isTimed ? 0 : state.remainingSeconds,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ExamSessionStatus.failure,
          error: AppErrorHandler.getErrorMessage(e),
        ),
      );
    }
  }

  bool isQuestionAnswered(QuestionEntity question) {
    final id = (question.id ?? '').trim();
    if (id.isEmpty) return false;
    return ExamAnswerUtils.isAnswered(
      question,
      state.answersByQuestionId[id] ?? const [],
    );
  }

  @override
  Future<void> close() {
    _ticker?.cancel();
    return super.close();
  }
}
