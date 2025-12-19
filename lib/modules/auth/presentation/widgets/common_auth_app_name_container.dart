import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class CommonAuthAppNameContainer extends StatelessWidget {
  const CommonAuthAppNameContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ParentTextWidget(
        AppConstants.appName,
        style: context.textTheme.headlineLarge?.copyWith(
          fontWeight: AppFontWeight.extraBold,
          color: context.colorScheme.primaryContainer,
        ),
      ),
    );
  }
}
