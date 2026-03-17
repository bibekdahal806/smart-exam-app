part of 'exam_session_cubit.dart';

enum ExamSessionStatus {
  initial,
  loading,
  ready,
  submitting,
  submitted,
  expired,
  failure,
}

class ExamSessionState extends Equatable {
  final ExamSessionStatus status;
  final ExamEntity exam;
  final ExamSessionEntity? session;
  final Map<String, List<String>> answersByQuestionId;
  final int currentIndex;
  final int remainingSeconds;
  final String? error;
  final bool autoSubmitted;

  const ExamSessionState({
    this.status = ExamSessionStatus.initial,
    this.exam = const ExamEntity(),
    this.session,
    this.answersByQuestionId = const {},
    this.currentIndex = 0,
    this.remainingSeconds = -1,
    this.error,
    this.autoSubmitted = false,
  });

  bool get isTimed => exam.isTimed;
  int get totalQuestions => exam.questions.length;
  bool get hasPrevious => currentIndex > 0;
  bool get hasNext => currentIndex < totalQuestions - 1;
  bool get isLastQuestion => totalQuestions > 0 && currentIndex == totalQuestions - 1;

  QuestionEntity? get currentQuestion {
    if (exam.questions.isEmpty || currentIndex < 0 || currentIndex >= exam.questions.length) {
      return null;
    }
    return exam.questions[currentIndex];
  }

  List<QuestionResultEntity> get results =>
      ExamAnswerUtils.normalizeResults(questions: exam.questions, answersByQuestionId: answersByQuestionId);

  ExamSessionState copyWith({
    ExamSessionStatus? status,
    ExamEntity? exam,
    ExamSessionEntity? session,
    Map<String, List<String>>? answersByQuestionId,
    int? currentIndex,
    int? remainingSeconds,
    String? error,
    bool? autoSubmitted,
  }) {
    return ExamSessionState(
      status: status ?? this.status,
      exam: exam ?? this.exam,
      session: session ?? this.session,
      answersByQuestionId: answersByQuestionId ?? this.answersByQuestionId,
      currentIndex: currentIndex ?? this.currentIndex,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      error: error,
      autoSubmitted: autoSubmitted ?? this.autoSubmitted,
    );
  }

  @override
  List<Object?> get props => [
        status,
        exam,
        session,
        answersByQuestionId,
        currentIndex,
        remainingSeconds,
        error,
        autoSubmitted,
      ];
}
