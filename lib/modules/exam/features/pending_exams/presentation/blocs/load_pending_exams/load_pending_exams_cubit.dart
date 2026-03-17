import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

part 'load_pending_exams_state.dart';

class LoadPendingExamsCubit extends Cubit<LoadPendingExamsState> {
  final LocalExamSessionRepository _localExamSessionRepository =
      getIt<LocalExamSessionRepository>();

  StreamSubscription<List<ExamSessionEntity>>? _subscription;

  LoadPendingExamsCubit() : super(const LoadPendingExamsState());

  Future<void> loadPendingExams() async {
    emit(state.copyWith(loadingState: AppLoadingState.loading, error: null));

    await _subscription?.cancel();

    _subscription = _localExamSessionRepository.watchPendingSessions().listen(
      (sessions) {
        emit(
          state.copyWith(
            loadingState: AppLoadingState.success,
            pendingExams: sessions,
            error: null,
          ),
        );
      },
      onError: (error) {
        emit(
          state.copyWith(
            loadingState: AppLoadingState.failure,
            error: AppErrorHandler.getErrorMessage(error),
          ),
        );
      },
    );
  }

  Future<void> reloadPendingExams() async {
    return loadPendingExams();
  }

  Future<void> deletePendingExam(String examId) async {
    try {
      await _localExamSessionRepository.deleteSession(examId);
    } catch (e) {
      emit(
        state.copyWith(
          loadingState: AppLoadingState.failure,
          error: AppErrorHandler.getErrorMessage(e),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    return super.close();
  }
}
