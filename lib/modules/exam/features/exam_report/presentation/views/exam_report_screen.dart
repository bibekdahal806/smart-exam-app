import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamReportScreen extends StatelessWidget {
  const ExamReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoadExamReportCubit()..loadExamReport(),
      child: ExamReportScreenView(),
    );
  }
}

class ExamReportScreenView extends StatelessWidget {
  const ExamReportScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        showBackButton: true,
        title: ParentTextWidget(
          "Exam Reports",
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
          child: BlocBuilder<LoadExamReportCubit, LoadExamReportState>(
            builder: (context, state) {
              if (state.loadingState.isInitial ||
                  state.loadingState.isLoading) {
                return const ExamReportListViewLoading();
              } else if (state.loadingState.isSuccess &&
                  state.reports.isNotEmpty) {
                return ExamReportListViewSuccess(loadExamReportState: state);
              }
              return ExamReportListViewError(loadExamReportState: state);
            },
          ),
        ),
      ),
    );
  }
}
