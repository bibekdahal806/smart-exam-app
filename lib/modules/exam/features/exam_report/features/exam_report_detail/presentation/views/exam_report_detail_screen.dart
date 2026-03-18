import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamReportDetailScreen extends StatelessWidget {
  final ExamReportDetailArgument argument;
  const ExamReportDetailScreen({super.key, required this.argument});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        showBackButton: true,
        title: ParentTextWidget(
          argument.examReport.title ?? "Exam Report",
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: AppFontWeight.medium,
            color: context.customTheme.textPrimary,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: ParentPaddingWidget(
          top: AppSpacing.sm.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ExamReportDetailTopCard(examReport: argument.examReport),
                16.verticalSpace,
                ...argument.examReport.questions.map(
                  (e) => ExamReportDetailQuestionCard(question: e),
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
