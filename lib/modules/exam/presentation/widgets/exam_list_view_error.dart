import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/exam/exam.dart';

class ExamListViewError extends StatelessWidget {
  final LoadExamsState loadExamsState;

  const ExamListViewError({super.key, required this.loadExamsState});

  String _accessTypeLabel(String? accessType) {
    switch (accessType) {
      case 'free':
        return 'free';
      case 'assigned':
        return 'assigned';
      default:
        return 'filtered';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFailure = loadExamsState.loadingState.isFailure;
    final selectedAccessType = loadExamsState.selectedAccessType;

    return Column(
      children: [
        150.verticalSpace,
        Center(
          child: ErrorScreenWidget(
            errorTitle: Messages.noResultFound,
            errorDescription: isFailure
                ? loadExamsState.error ?? Messages.noResultFoundDesc("exams")
                : selectedAccessType == null
                ? Messages.noResultFoundDesc("exams")
                : 'No ${_accessTypeLabel(selectedAccessType)} exams found.',
            showButton: isFailure,
            onButtonTap: isFailure
                ? () {
                    context.read<LoadExamsCubit>().reloadExams();
                  }
                : null,
          ),
        ),
      ],
    );
  }
}
