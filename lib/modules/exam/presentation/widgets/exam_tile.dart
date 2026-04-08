import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
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
    final isTimed = exam.isTimed;

    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        if (exam.isAttempted) {
          CustomSnackbar.showToastMessage(
            type: .error,
            message: "Exam is already attempted.",
          );
          return;
        }

        context.pushNamed(
          Routes.examDetail.name,
          extra: ExamDetailArgument(exam: exam),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlphaOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 📊 Left Icon
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: isTimed ? Colors.red.shade100 : Colors.green.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                isTimed ? Icons.timer : Icons.school,
                color: isTimed ? Colors.red : Colors.green,
              ),
            ),

            const SizedBox(width: 16),

            // 📚 Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exam.title ?? 'Exam',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    _subtitle(),
                    style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
                  ),

                  const SizedBox(height: 10),

                  // 🏷️ Tags Row
                  Row(
                    children: [
                      _buildTag(
                        label: isTimed ? 'Timed' : 'Practice',
                        color: isTimed ? Colors.red : Colors.green,
                      ),
                      const SizedBox(width: 8),
                      _buildTag(
                        label: '${exam.questions.length} Qs',
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ⭐ Bookmark
            Column(
              children: [
                BookmarkExamButton(exam: exam),
                const SizedBox(height: 8),
                const Icon(Icons.chevron_right),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag({required String label, required Color color}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlphaOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
