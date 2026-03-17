import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamReportListViewSuccess extends StatelessWidget {
  final LoadExamReportState loadExamReportState;

  const ExamReportListViewSuccess({
    super.key,
    required this.loadExamReportState,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: loadExamReportState.reports.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, _) => 16.verticalSpace,
      itemBuilder: (context, index) {
        final report = loadExamReportState.reports[index];
        return ExamReportTile(exam: report);
      },
    );
  }
}
