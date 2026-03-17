import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/exam/exam.dart';
import 'package:q_bank/modules/subjects/subjects.dart';

class SubjectTile extends StatelessWidget {
  final SubjectEntity subject;

  const SubjectTile({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(subject.name ?? 'Subject'),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          context.pushNamed(
            Routes.exam.name,
            extra: ExamScreenArgument.bySubject(
              subjectId: (subject.id ?? '').trim(),
              subjectName: subject.name,
            ),
          );
        },
      ),
    );
  }
}
