part of 'load_pending_exams_cubit.dart';

class LoadPendingExamsState extends Equatable {
  final AppLoadingState loadingState;
  final List<ExamSessionEntity> pendingExams;
  final String? error;

  const LoadPendingExamsState({
    this.loadingState = AppLoadingState.initial,
    this.pendingExams = const [],
    this.error,
  });

  LoadPendingExamsState copyWith({
    AppLoadingState? loadingState,
    List<ExamSessionEntity>? pendingExams,
    String? error,
  }) {
    return LoadPendingExamsState(
      loadingState: loadingState ?? this.loadingState,
      pendingExams: pendingExams ?? this.pendingExams,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loadingState, pendingExams, error];
}
