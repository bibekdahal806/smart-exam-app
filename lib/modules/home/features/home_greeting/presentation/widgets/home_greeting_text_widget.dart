import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class HomeGreetingTextWidget extends StatelessWidget {
  const HomeGreetingTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ParentPaddingWidget(
      top: 0,
      bottom: AppSpacing.sm.h,
      child: Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .start,
        children: [
          ParentTextWidget(
            "Hello, ${context.currentUserShortName} 👋",
            style: context.textTheme.titleLarge?.copyWith(
              fontWeight: AppFontWeight.bold,
              color: context.theme.colorScheme.surface,
            ),
          ),
          AppGaps.gapH2,
          ParentTextWidget(
            "Welcome Back!",
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: AppFontWeight.medium,
              color: context.theme.colorScheme.surface,
            ),
          ),
        ],
      ),
    );
  }
}
