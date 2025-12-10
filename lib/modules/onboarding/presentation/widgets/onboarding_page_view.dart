import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
    required this.pageController,
    required this.onboardingEntities,
  });
  final List<OnboardingEntity> onboardingEntities;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,

      onPageChanged: (value) {
        context.read<OnboardingShowInfoCubit>().updateCurrentPage(value);
      },
      children: onboardingEntities
          .map(
            (e) => OnboardingPageviewTile(
              image: e.image,
              title: e.title,
              description: e.description,
            ),
          )
          .toList(),

      // [
      //   OnboardingPageviewTile(
      //     image: AssetRoutes.defaultPlaceholderImagePath,
      //     title: "Welcome",
      //     description: ParentTextWidget(
      //       "Welcome description here",
      //       textAlign: TextAlign.center,
      //       style: context.textTheme.titleSmall?.copyWith(
      //         fontWeight: AppFontWeight.regular,
      //         color: context.customTheme.textSecondary,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
}
