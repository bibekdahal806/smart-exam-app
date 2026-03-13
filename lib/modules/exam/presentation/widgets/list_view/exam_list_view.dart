import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamListView extends StatelessWidget {
  const ExamListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadExamsCubit, LoadExamsState>(
      builder: (context, state) {
        if (state.loadingState.isInitial || state.loadingState.isLoading) {
          // AdventureTile
          return ExamListViewLoading();
        } else if (state.loadingState.isSuccess && state.exams.isNotEmpty) {
          return ExamListViewSuccess(loadExamsState: state);
        }
        return ExamListViewError(loadExamsState: state);
      },
    );
  }
}
