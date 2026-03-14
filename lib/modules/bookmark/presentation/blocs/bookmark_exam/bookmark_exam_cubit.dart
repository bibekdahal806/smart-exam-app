import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/bookmark/bookmark.dart';
import 'package:q_bank/modules/exam/exam.dart';

part 'bookmark_exam_state.dart';

class BookmarkExamCubit extends Cubit<BookmarkExamState> {
  final LocalBookmarkedExamRepository _bookmarkedExamRepository =
      getIt<LocalBookmarkedExamRepository>();

  StreamSubscription<List<ExamEntity>>? _subscription;

  BookmarkExamCubit() : super(const BookmarkExamState());

  Future<void> loadBookmarkedExams() async {
    emit(state.copyWith(loadingState: AppLoadingState.loading, error: null));

    await _subscription?.cancel();

    _subscription = _bookmarkedExamRepository.watchBookmarkedExams().listen(
      (exams) {
        emit(
          state.copyWith(
            loadingState: AppLoadingState.success,
            exams: exams,
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

  Future<void> removeBookmark(String examId) async {
    try {
      await _bookmarkedExamRepository.removeBookmark(examId);
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
