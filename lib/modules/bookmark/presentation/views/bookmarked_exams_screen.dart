import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/bookmark/bookmark.dart';

class BookmarkedExamsScreen extends StatelessWidget {
  const BookmarkedExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BookmarkExamCubit>.value(
      value: context.read<BookmarkExamCubit>(),
      child: const BookmarkedExamsScreenView(),
    );
  }
}

class BookmarkedExamsScreenView extends StatelessWidget {
  const BookmarkedExamsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        showBackButton: false,
        title: ParentTextWidget(
          "Bookmarked Exams",
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: AppFontWeight.medium,
            color: context.customTheme.textPrimary,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: ParentPaddingWidget(
          top: AppSpacing.sm.h,
          child: BlocBuilder<BookmarkExamCubit, BookmarkExamState>(
            builder: (context, state) {
              if (state.loadingState.isInitial ||
                  state.loadingState.isLoading) {
                return const BookmarkExamListViewLoading();
              } else if (state.loadingState.isSuccess &&
                  state.exams.isNotEmpty) {
                return BookmarkExamListViewSuccess(bookmarkExamState: state);
              }
              return BookmarkExamListViewError(bookmarkExamState: state);
            },
          ),
        ),
      ),
    );
  }
}
