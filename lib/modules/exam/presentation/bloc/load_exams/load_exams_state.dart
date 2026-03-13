part of 'load_exams_cubit.dart';

class LoadExamsState extends Equatable {
  final AppLoadingState loadingState;
  final List<ExamEntity> exams;
  final String? error;
  const LoadExamsState({
    this.loadingState = AppLoadingState.initial,
    this.exams = const [],
    this.error,
  });
  LoadExamsState copyWith({
    AppLoadingState? loadingState,
    List<ExamEntity>? exams,
    String? error,
  }) => LoadExamsState(
    loadingState: loadingState ?? this.loadingState,
    exams: exams ?? this.exams,
    error: error,
  );

  @override
  List<Object?> get props => [loadingState, exams, error];
}
