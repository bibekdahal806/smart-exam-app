import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class PendingExamListViewError extends StatelessWidget {
  final LoadPendingExamsState state;

  const PendingExamListViewError({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        150.verticalSpace,
        Center(
          child: ErrorScreenWidget(
            errorTitle: Messages.noResultFound,
            errorDescription:
                state.error ?? Messages.noResultFoundDesc("pending exams"),
            showButton: true,
            onButtonTap: () {
              context.read<LoadPendingExamsCubit>().reloadPendingExams();
            },
          ),
        ),
      ],
    );
  }
}
