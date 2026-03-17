import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/subjects/subjects.dart';

class SubjectListViewSuccess extends StatelessWidget {
  final LoadSubjectsState loadSubjectsState;
  const SubjectListViewSuccess({super.key, required this.loadSubjectsState});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: loadSubjectsState.subjects.length,
      shrinkWrap: true,
      padding: .zero,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) => 12.verticalSpace,
      itemBuilder: (context, index) {
        return SubjectTile(subject: loadSubjectsState.subjects[index]);
      },
    );
  }
}
