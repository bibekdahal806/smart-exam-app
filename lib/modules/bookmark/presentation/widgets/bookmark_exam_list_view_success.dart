import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/bookmark/bookmark.dart';
import 'package:q_bank/modules/exam/exam.dart';

class BookmarkExamListViewSuccess extends StatelessWidget {
  final BookmarkExamState bookmarkExamState;

  const BookmarkExamListViewSuccess({
    super.key,
    required this.bookmarkExamState,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: bookmarkExamState.exams.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, _) => 16.verticalSpace,
      itemBuilder: (context, index) {
        final exam = bookmarkExamState.exams[index];
        return ExamTile(exam: exam);
      },
    );
  }
}
