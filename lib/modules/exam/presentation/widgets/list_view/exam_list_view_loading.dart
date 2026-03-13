import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ExamListViewLoading extends StatelessWidget {
  const ExamListViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      child: ListView.separated(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => 16.verticalSpace,
        itemBuilder: (context, index) {
          return Center();
          // return AdventureTile(adventure: adventureDummyData);
        },
      ),
    );
  }
}
