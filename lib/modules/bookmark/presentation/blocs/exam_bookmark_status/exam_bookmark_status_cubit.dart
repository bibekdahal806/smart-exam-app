import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/bookmark/bookmark.dart';
import 'package:q_bank/modules/exam/exam.dart';

part 'exam_bookmark_status_state.dart';

class ExamBookmarkStatusCubit extends Cubit<ExamBookmarkStatusState> {
  final LocalBookmarkedExamRepository _bookmarkedExamRepository =
      getIt<LocalBookmarkedExamRepository>();

  StreamSubscription<bool>? _subscription;

  ExamBookmarkStatusCubit() : super(const ExamBookmarkStatusState());

  Future<void> watchExam(String examId) async {
    emit(state.copyWith(loadingState: AppLoadingState.loading, error: null));

    await _subscription?.cancel();

    _subscription = _bookmarkedExamRepository
        .watchIsBookmarked(examId)
        .listen(
          (isBookmarked) {
            emit(
              state.copyWith(
                loadingState: AppLoadingState.success,
                isBookmarked: isBookmarked,
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

  Future<void> toggleBookmark(ExamEntity exam) async {
    try {
      await _bookmarkedExamRepository.toggleBookmark(exam);
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
