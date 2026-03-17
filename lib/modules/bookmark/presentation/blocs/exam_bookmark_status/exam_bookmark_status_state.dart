part of 'exam_bookmark_status_cubit.dart';

class ExamBookmarkStatusState extends Equatable {
  final AppLoadingState loadingState;
  final bool isBookmarked;
  final String? error;

  const ExamBookmarkStatusState({
    this.loadingState = AppLoadingState.initial,
    this.isBookmarked = false,
    this.error,
  });

  ExamBookmarkStatusState copyWith({
    AppLoadingState? loadingState,
    bool? isBookmarked,
    String? error,
  }) {
    return ExamBookmarkStatusState(
      loadingState: loadingState ?? this.loadingState,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loadingState, isBookmarked, error];
}
