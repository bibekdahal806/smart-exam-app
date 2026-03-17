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

  void onResume(BuildContext context, ExamSessionEntity session) async {
    final result = await context.pushNamed(
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
        return Card(
          child: ListTile(
            title: Text('${session.exam.title}'),
            subtitle: Text(_subtitle(session)),
            trailing: PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'resume') {
                  onResume(context, session);
                } else if (value == 'delete') {
                  context.read<LoadPendingExamsCubit>().deletePendingExam(
                    session.examId,
                  );
                }
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: (_) => const [
                PopupMenuItem(value: 'resume', child: Text('Resume')),
                PopupMenuItem(value: 'delete', child: Text('Delete')),
              ],
            ),
            onTap: () => onResume(context, session),
          ),
        );
      },
    );
  }
}
