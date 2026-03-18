import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class PendingExamListViewSuccess extends StatelessWidget {
  final LoadPendingExamsState state;

  const PendingExamListViewSuccess({super.key, required this.state});

  String _subtitle(ExamSessionEntity session) {
    final remaining = session.remainingSecondsAt(DateTime.now());
    if (remaining < 0) return 'Unlimited time';
    final duration = Duration(seconds: remaining).toString().split('.').first;
    return 'Remaining: $duration';
  }

  String _progressText(ExamSessionEntity session) {
    final total = session.exam.questions.length;
    final current = total == 0 ? 0 : (session.currentIndex + 1).clamp(0, total);
    return 'Question $current of $total';
  }

  double _progressValue(ExamSessionEntity session) {
    final total = session.exam.questions.length;
    if (total == 0) return 0;
    return ((session.currentIndex + 1) / total).clamp(0, 1);
  }

  void onResume(BuildContext context, ExamSessionEntity session) async {
    await context.pushNamed(
      Routes.examDetail.name,
      extra: ExamDetailArgument.fromSession(session),
    );

    if (context.mounted) {
      context.read<LoadPendingExamsCubit>().reloadPendingExams();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: state.pendingExams.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, _) => 16.verticalSpace,
      itemBuilder: (context, index) {
        final session = state.pendingExams[index];
        final isTimed = session.isTimed;
        final subtitle = _subtitle(session);

        return InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () => onResume(context, session),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlphaOpacity(0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 52,
                  width: 52,
                  decoration: BoxDecoration(
                    color: isTimed
                        ? Colors.orange.shade100
                        : Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Icon(
                    isTimed ? Icons.timer_outlined : Icons.menu_book_rounded,
                    color: isTimed
                        ? Colors.orange.shade800
                        : Colors.blue.shade800,
                  ),
                ),

                const SizedBox(width: 14),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        session.exam.title ?? 'Untitled Exam',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          height: 1.2,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          _InfoChip(
                            icon: isTimed
                                ? Icons.schedule
                                : Icons.all_inclusive,
                            label: subtitle,
                            color: isTimed ? Colors.orange : Colors.blue,
                          ),
                          _InfoChip(
                            icon: Icons.help_outline_rounded,
                            label: '${session.exam.questions.length} questions',
                            color: Colors.purple,
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      Text(
                        _progressText(session),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 6),

                      ClipRRect(
                        borderRadius: BorderRadius.circular(999),
                        child: LinearProgressIndicator(
                          value: _progressValue(session),
                          minHeight: 8,
                          backgroundColor: Colors.grey.shade200,
                        ),
                      ),

                      const SizedBox(height: 12),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'resume') {
                      onResume(context, session);
                    } else if (value == 'delete') {
                      context.read<LoadPendingExamsCubit>().deletePendingExam(
                        session.examId,
                      );
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  icon: Icon(
                    Icons.more_vert_rounded,
                    color: Colors.grey.shade700,
                  ),
                  itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: 'resume',
                      child: Row(
                        children: [
                          Icon(Icons.play_arrow_rounded, size: 18),
                          SizedBox(width: 8),
                          Text('Resume'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          Icon(Icons.delete_outline_rounded, size: 18),
                          SizedBox(width: 8),
                          Text('Delete'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: color.withAlphaOpacity(0.10),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
