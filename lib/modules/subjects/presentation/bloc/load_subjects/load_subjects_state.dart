part of 'load_subjects_cubit.dart';

class LoadSubjectsState extends Equatable {
  final AppLoadingState loadingState;
  final List<SubjectEntity> subjects;
  final String? error;
  const LoadSubjectsState({
    this.loadingState = AppLoadingState.initial,
    this.subjects = const [],
    this.error,
  });
  LoadSubjectsState copyWith({
    AppLoadingState? loadingState,
    List<SubjectEntity>? subjects,
    String? error,
  }) => LoadSubjectsState(
    loadingState: loadingState ?? this.loadingState,
    subjects: subjects ?? this.subjects,
    error: error,
  );

  @override
  List<Object?> get props => [loadingState, subjects, error];
}
