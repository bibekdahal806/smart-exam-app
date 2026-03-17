import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/subjects/subjects.dart';

class SubjectListView extends StatelessWidget {
  const SubjectListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadSubjectsCubit, LoadSubjectsState>(
      builder: (context, state) {
        if (state.loadingState.isInitial || state.loadingState.isLoading) {
          // AdventureTile
          return SubjectListViewLoading();
        } else if (state.loadingState.isSuccess && state.subjects.isNotEmpty) {
          return SubjectListViewSuccess(loadSubjectsState: state);
        }
        return SubjectListViewError(loadSubjectsState: state);
      },
    );
  }
}
