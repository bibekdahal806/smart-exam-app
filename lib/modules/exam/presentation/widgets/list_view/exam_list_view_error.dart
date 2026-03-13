import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamListViewError extends StatelessWidget {
  final LoadExamsState loadExamsState;
  const ExamListViewError({super.key, required this.loadExamsState});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ErrorScreenWidget(
        errorTitle: Messages.noResultFound,
        errorDescription:
            loadExamsState.error ?? Messages.noResultFoundDesc("exams"),
        showButton: true,
        onButtonTap: () {
          context.read<LoadExamsCubit>().reLoadExams();
        },
      ),
    );
  }
}
