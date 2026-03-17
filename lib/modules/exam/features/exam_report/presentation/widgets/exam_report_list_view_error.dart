import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamReportListViewError extends StatelessWidget {
  final LoadExamReportState loadExamReportState;

  const ExamReportListViewError({super.key, required this.loadExamReportState});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        150.verticalSpace,
        Center(
          child: ErrorScreenWidget(
            errorTitle: Messages.noResultFound,
            errorDescription:
                loadExamReportState.error ??
                Messages.noResultFoundDesc("exam reports"),
            showButton: true,
            onButtonTap: () {
              context.read<LoadExamReportCubit>().reloadExamReport();
            },
          ),
        ),
      ],
    );
  }
}
