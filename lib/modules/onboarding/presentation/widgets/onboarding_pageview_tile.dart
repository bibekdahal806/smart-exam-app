import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class OnboardingPageviewTile extends StatelessWidget {
  final String image;
  final String title;
  final Widget description;
  const OnboardingPageviewTile({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: SvgViewer.fromAsset(
              path: image,
              height: (context.deviceHeight * 0.2),
              width: (context.deviceHeight * 0.5),
              //
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: ParentPaddingWidget(
            hasSafeArea: false,
            top: 0,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppGaps.gapH40,
                  ParentTextWidget(
                    title,
                    textAlign: TextAlign.center,
                    style: context.textTheme.titleMedium?.copyWith(
                      fontWeight: AppFontWeight.bold,
                      color: context.customTheme.textPrimary,
                    ),
                  ),
                  AppGaps.gapH8,
                  description,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
