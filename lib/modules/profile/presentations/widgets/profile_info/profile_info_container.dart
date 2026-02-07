import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';

class ProfileInfoContainer extends StatelessWidget {
  const ProfileInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ParentPaddingWidget(
      bottom: 0,
      hasSafeArea: false,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(AppSpacing.sm.r),
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.largeBorderRadius,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ProfileInfoWidget()],
          ),
        ),
      ),
    );
  }
}
