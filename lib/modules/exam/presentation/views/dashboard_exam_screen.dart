import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/subjects/subjects.dart';

class DashboardExamScreen extends StatelessWidget {
  const DashboardExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        showBackButton: false,
        title: ParentTextWidget(
          "Subjects",
          style: context.textTheme.bodyMedium?.copyWith(
            fontWeight: AppFontWeight.medium,
            color: context.customTheme.textPrimary,
          ),
        ),
        centerTitle: false,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<LoadSubjectsCubit>().reLoadSubjects();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ParentPaddingWidget(
            top: AppSpacing.sm.h,
            child: SubjectListView(),
          ),
        ),
      ),
    );
  }
}
