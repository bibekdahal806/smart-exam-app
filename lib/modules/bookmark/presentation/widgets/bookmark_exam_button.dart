import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/bookmark/bookmark.dart';
import 'package:q_bank/modules/exam/exam.dart';

class BookmarkExamButton extends StatelessWidget {
  final ExamEntity exam;

  const BookmarkExamButton({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final examId = (exam.id ?? '').trim();

    return BlocProvider(
      create: (_) => ExamBookmarkStatusCubit()..watchExam(examId),
      child: BlocBuilder<ExamBookmarkStatusCubit, ExamBookmarkStatusState>(
        builder: (context, state) {
          return IconButton(
            onPressed: () {
              context.read<ExamBookmarkStatusCubit>().toggleBookmark(exam);
            },
            icon: Icon(
              state.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
            ),
          );
        },
      ),
    );
  }
}
