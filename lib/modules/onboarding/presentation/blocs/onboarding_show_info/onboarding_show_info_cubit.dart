import 'package:bloc/bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';

class OnboardingShowInfoCubit extends Cubit<int> {
  OnboardingShowInfoCubit() : super(0);

  List<OnboardingEntity> onboardingContent(BuildContext context) => [
    OnboardingEntity(
      image: AssetRoutes.onboarding1ImagePath,
      title: "Welcome to Flutter Starter.",
      description: ParentTextWidget(
        "This app is a starter for flutter projects.",
        textAlign: TextAlign.center,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: AppFontWeight.regular,
          color: context.customTheme.textPrimary,
        ),
      ),
    ),
    OnboardingEntity(
      image: AssetRoutes.onboarding2ImagePath,
      title: "Start developing now.",
      description: ParentTextWidget(
        "You can start coding now just by clone this repo.",
        textAlign: TextAlign.center,
        style: context.textTheme.bodySmall?.copyWith(
          fontWeight: AppFontWeight.regular,
          color: context.customTheme.textPrimary,
        ),
      ),
    ),
    OnboardingEntity(
      image: AssetRoutes.onboarding3ImagePath,
      title: "Icon Downloaded From?",
      description: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "I have downloaded the icon from ",
          style: context.textTheme.bodySmall?.copyWith(
            fontWeight: AppFontWeight.regular,
            color: context.customTheme.textPrimary,
          ),
          children: [
            TextSpan(
              text: "https://undraw.co/",
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: AppFontWeight.semiBold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  try {
                    await UrlHelper().launch("https://undraw.co/");
                  } catch (_) {}
                },
            ),
          ],
        ),
      ),
    ),

    //
  ];

  void updateCurrentPage(int value) {
    emit(value);
  }
}
