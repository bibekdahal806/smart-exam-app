import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class CommonAuthScreenLayout extends StatelessWidget {
  final Widget child;
  const CommonAuthScreenLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: context.colorScheme.primary,
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                decoration: BoxDecoration(color: context.colorScheme.primary),
                child: Column(
                  mainAxisAlignment: .start,
                  crossAxisAlignment: .center,
                  mainAxisSize: .max,
                  children: [
                    AppGaps.gapHCustom(100.h),
                    CommonAuthAppNameContainer(),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: .start,
              crossAxisAlignment: .start,
              mainAxisSize: .max,
              children: [
                AppGaps.gapHCustom(200.h),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.colorScheme.onPrimary,
                      borderRadius: BorderRadius.vertical(
                        top: AppBorderRadius.chipRadius,
                        // right: AppBorderRadius.chipRadius,
                      ),
                    ),
                    child: SingleChildScrollView(child: child),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
