import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/bookmark/bookmark.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamTile extends StatelessWidget {
  final ExamEntity exam;

  const ExamTile({super.key, required this.exam});

  String _subtitle() {
    final questionCount = exam.questions.length;
    if (exam.isTimed && exam.durationSeconds != null) {
      final minutes = (exam.durationSeconds! / 60).ceil();
      return '$questionCount questions • $minutes min';
    }
    return '$questionCount questions • Unlimited time';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(exam.title ?? 'Exam'),
        subtitle: Text(_subtitle()),
        trailing: BookmarkExamButton(exam: exam),
        onTap: () {
          context.pushNamed(
            Routes.examDetail.name,
            extra: ExamDetailArgument(exam: exam),
          );
        },
      ),
    );
  }
}
