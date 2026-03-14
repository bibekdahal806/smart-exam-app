import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamListView extends StatelessWidget {
  final ExamScreenArgument argument;

  const ExamListView({super.key, required this.argument});

  String get _title {
    if (argument.loadAll) return 'Exams';
    return argument.subjectName ?? 'Subject Exams';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        showBackButton: !argument.loadAll,
        title: ParentTextWidget(
          _title,
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
          child: BlocBuilder<LoadExamsCubit, LoadExamsState>(
            builder: (context, state) {
              if (state.loadingState.isInitial ||
                  state.loadingState.isLoading) {
                return const ExamListViewLoading();
              } else if (state.loadingState.isSuccess &&
                  state.exams.isNotEmpty) {
                return ExamListViewSuccess(loadExamsState: state);
              }
              return ExamListViewError(loadExamsState: state);
            },
          ),
        ),
      ),
    );
  }
}
