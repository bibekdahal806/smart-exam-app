part of 'load_exams_cubit.dart';

class LoadExamsState extends Equatable {
  final AppLoadingState loadingState;
  final List<ExamEntity> exams;
  final ExamScreenArgument? argument;
  final String? error;

  const LoadExamsState({
    this.loadingState = AppLoadingState.initial,
    this.exams = const [],
    this.argument,
    this.error,
  });

  LoadExamsState copyWith({
    AppLoadingState? loadingState,
    List<ExamEntity>? exams,
    ExamScreenArgument? argument,
    String? error,
  }) {
    return LoadExamsState(
      loadingState: loadingState ?? this.loadingState,
      exams: exams ?? this.exams,
      argument: argument ?? this.argument,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loadingState, exams, argument, error];
}
