import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/subjects/subjects.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SubjectListViewLoading extends StatelessWidget {
  const SubjectListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          const crossAxisCount = 2;
          final crossAxisSpacing = AppSpacing.md.w;
          final availableWidth =
              constraints.maxWidth - (crossAxisSpacing * (crossAxisCount - 1));
          final itemWidth = availableWidth / crossAxisCount;
          final itemHeight = (itemWidth * 1.25).clamp(230.0, 290.0).toDouble();

          return GridView.builder(
            itemCount: 6,
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
              return SubjectTile(
                subject: subjectDummyData[index % subjectDummyData.length],
              );
            },
          );
        },
      ),
    );
  }
}
