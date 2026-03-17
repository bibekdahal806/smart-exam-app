part of 'bookmark_exam_cubit.dart';

class BookmarkExamState extends Equatable {
  final AppLoadingState loadingState;
  final List<ExamEntity> exams;
  final String? error;

  const BookmarkExamState({
    this.loadingState = AppLoadingState.initial,
    this.exams = const [],
    this.error,
  });

  BookmarkExamState copyWith({
    AppLoadingState? loadingState,
    List<ExamEntity>? exams,
    String? error,
  }) {
    return BookmarkExamState(
      loadingState: loadingState ?? this.loadingState,
      exams: exams ?? this.exams,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loadingState, exams, error];
}
