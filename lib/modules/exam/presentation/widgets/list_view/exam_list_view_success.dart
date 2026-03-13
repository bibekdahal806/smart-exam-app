import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamListViewSuccess extends StatelessWidget {
  final LoadExamsState loadExamsState;
  const ExamListViewSuccess({super.key, required this.loadExamsState});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: loadExamsState.exams.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => 16.verticalSpace,
      itemBuilder: (context, index) {
        return Center();
      },
    );
  }
}
