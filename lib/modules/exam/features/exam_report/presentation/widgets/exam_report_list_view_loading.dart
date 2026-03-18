import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExamReportListViewLoading extends StatelessWidget {
  const ExamReportListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.separated(
        itemCount: 5,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (_, _) => 16.verticalSpace,
        itemBuilder: (context, index) {
          return ExamReportTile(exam: examReportDummyData.first);
        },
      ),
    );
  }
}
