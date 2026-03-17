import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/exam/exam.dart';

class PendingExamListView extends StatelessWidget {
  const PendingExamListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadPendingExamsCubit, LoadPendingExamsState>(
      builder: (context, state) {
        if (state.loadingState.isInitial || state.loadingState.isLoading) {
          return const PendingExamListViewLoading();
        } else if (state.loadingState.isSuccess &&
            state.pendingExams.isNotEmpty) {
          return PendingExamListViewSuccess(state: state);
        }
        return PendingExamListViewError(state: state);
      },
    );
  }
}
