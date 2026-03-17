import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/utils/extensions/num_extension.dart';
import 'package:q_bank/modules/bookmark/bookmark.dart';

class BookmarkExamListViewError extends StatelessWidget {
  final BookmarkExamState bookmarkExamState;

  const BookmarkExamListViewError({super.key, required this.bookmarkExamState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        150.verticalSpace,
        Center(
          child: ErrorScreenWidget(
            errorTitle: Messages.noResultFound,
            errorDescription:
                bookmarkExamState.error ??
                Messages.noResultFoundDesc("bookmarked exams"),
            showButton: true,
            onButtonTap: () {
              context.read<BookmarkExamCubit>().loadBookmarkedExams();
            },
          ),
        ),
      ],
    );
  }
}
