import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';
import 'package:q_bank/modules/subjects/subjects.dart';

class SubjectTile extends StatelessWidget {
  final SubjectEntity subject;

  const SubjectTile({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        context.pushNamed(
          Routes.exam.name,
          extra: ExamScreenArgument.bySubject(
            subjectId: (subject.id ?? '').trim(),
            subjectName: subject.name,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Colors.blue.shade50, Colors.blue.shade100],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlphaOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // 📘 Icon / Avatar
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.menu_book, color: Colors.white),
            ),

            const SizedBox(width: 16),

            // 📚 Subject Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject.name ?? 'Subject',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${subject.examCount ?? 0} exams',
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),

            // ➡️ Arrow
            const Icon(Icons.chevron_right, size: 28),
          ],
        ),
      ),
    );
  }
}
