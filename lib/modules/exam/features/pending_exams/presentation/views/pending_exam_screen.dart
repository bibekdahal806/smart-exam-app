import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class PendingExamsScreen extends StatelessWidget {
  const PendingExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoadPendingExamsCubit()..loadPendingExams(),
      child: PendingExamsScreenView(),
    );
  }
}

class PendingExamsScreenView extends StatelessWidget {
  const PendingExamsScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pending Exams')),
      body: SingleChildScrollView(
        child: ParentPaddingWidget(
          top: AppSpacing.sm.h,
          child: PendingExamListView(),
        ),
      ),
    );
  }
}
