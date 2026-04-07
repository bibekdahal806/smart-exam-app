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
    final totalExams = subject.examCount ?? 0;
    final attemptedExams = subject.attemptedExamCount ?? 0;

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
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [const Color(0xFFF4F8FF), const Color(0xFFE6F0FF)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlphaOpacity(0.05),
              blurRadius: 14,
              offset: const Offset(0, 6),
            ),
          ],
          border: Border.all(color: const Color(0xFFD6E5FF)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 44,
                  width: 44,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2F80ED),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.menu_book_rounded,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Container(
                  height: 34,
                  width: 34,
                  decoration: BoxDecoration(
                    color: Colors.white.withAlphaOpacity(0.75),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.arrow_outward_rounded,
                    size: 18,
                    color: Color(0xFF2F80ED),
                  ),
                ),
              ],
            ),
            14.verticalSpace,
            Text(
              subject.name ?? 'Subject',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodyLarge?.copyWith(
                fontWeight: AppFontWeight.semiBold,
                color: const Color(0xFF1E2A3B),
              ),
            ),
            8.verticalSpace,
            Text(
              'Track total and attempted exams',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF617187),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: _SubjectStatBadge(
                label: 'Exams',
                value: totalExams.toString(),
              ),
            ),
            8.verticalSpace,
            SizedBox(
              width: double.infinity,
              child: _SubjectStatBadge(
                label: 'Attempted',
                value: attemptedExams.toString(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SubjectStatBadge extends StatelessWidget {
  final String label;
  final String value;

  const _SubjectStatBadge({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withAlphaOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Text(
            value,
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: AppFontWeight.bold,
              color: const Color(0xFF1E2A3B),
            ),
          ),
          6.horizontalSpace,
          Expanded(
            child: Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.textTheme.bodySmall?.copyWith(
                color: const Color(0xFF526174),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
