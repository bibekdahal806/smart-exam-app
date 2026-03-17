import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/modules/subjects/subjects.dart';

class SubjectListViewError extends StatelessWidget {
  final LoadSubjectsState loadSubjectsState;
  const SubjectListViewError({super.key, required this.loadSubjectsState});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ErrorScreenWidget(
        errorTitle: Messages.noResultFound,
        errorDescription:
            loadSubjectsState.error ?? Messages.noResultFoundDesc("subjects"),
        showButton: true,
        onButtonTap: () {
          context.read<LoadSubjectsCubit>().reLoadSubjects();
        },
      ),
    );
  }
}
