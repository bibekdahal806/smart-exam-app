import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/subjects/subjects.dart';

class SubjectListViewSuccess extends StatelessWidget {
  final LoadSubjectsState loadSubjectsState;
  const SubjectListViewSuccess({super.key, required this.loadSubjectsState});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const crossAxisCount = 2;
        final crossAxisSpacing = AppSpacing.md.w;
        final availableWidth =
            constraints.maxWidth - (crossAxisSpacing * (crossAxisCount - 1));
        final itemWidth = availableWidth / crossAxisCount;
        final itemHeight = (itemWidth * 1.25).clamp(230.0, 290.0).toDouble();

        return GridView.builder(
          itemCount: loadSubjectsState.subjects.length,
          shrinkWrap: true,
          padding: .zero,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: AppSpacing.md.h,
            childAspectRatio: itemWidth / itemHeight,
          ),
          itemBuilder: (context, index) {
            return SubjectTile(subject: loadSubjectsState.subjects[index]);
          },
        );
      },
    );
  }
}
