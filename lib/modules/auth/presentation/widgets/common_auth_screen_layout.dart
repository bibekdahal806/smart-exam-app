import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class CommonAuthScreenLayout extends StatelessWidget {
  final Widget child;
  const CommonAuthScreenLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          mainAxisSize: .max,
          children: [
            AppGaps.gapHCustom(50.h),
            CommonAuthAppNameContainer(),
            AppGaps.gapHCustom(50.h),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: context.colorScheme.onPrimary,
                  borderRadius: BorderRadius.horizontal(
                    left: AppBorderRadius.chipRadius,
                    right: AppBorderRadius.chipRadius,
                  ),
                  //
                ),
                child: SingleChildScrollView(child: child),
              ),
            ),
            // Expanded(child: SingleChildScrollView(

            // ))
          ],
        ),
      ),
    );
  }
}
