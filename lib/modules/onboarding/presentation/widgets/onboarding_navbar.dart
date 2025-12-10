import 'dart:io';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';
import 'package:go_router/go_router.dart';

class OnboardingNavbarWidget extends StatelessWidget {
  const OnboardingNavbarWidget({
    super.key,
    required this.pageController,
    required this.pageCount,
  });

  final PageController pageController;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingCubit, OnboardingState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, onboardingState) {
        if (onboardingState.loadingState.isSuccess) {
          context.goNamed(Routes.dashboard.name);
        } else if (onboardingState.loadingState.isFailure &&
            !onboardingState.error.isNullOrEmpty) {
          CustomSnackbar.showToastMessage(
            type: ToastType.error,
            message: onboardingState.error,
          );
        }
      },
      child: ParentPaddingWidget(
        bottom: Platform.isIOS ? AppSpacing.xs : AppSpacing.lg,
        top: 0,
        hasSafeArea: Platform.isIOS ? false : true,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          height: context.screenSize.height * 0.13,
          decoration: BoxDecoration(color: AppColors.transparent),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<OnboardingShowInfoCubit, int>(
                builder: (context, state) {
                  return Visibility(
                    visible: state == 0,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: TextButton(
                      onPressed: () async {
                        context.read<OnboardingCubit>().setOnBoardingValue(
                          showOnboardingValue: false,
                        );
                      },
                      child: ParentTextWidget(
                        "Skip",
                        textAlign: TextAlign.center,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: AppFontWeight.medium,
                          color: context.customTheme.textPrimary,
                        ),
                      ),
                    ),
                  );
                },
              ),
              Expanded(
                child: BlocBuilder<OnboardingShowInfoCubit, int>(
                  builder: (context, state) {
                    return DotsIndicator(
                      dotsCount: pageCount,
                      position: state.toDouble(),
                      decorator: DotsDecorator(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(360),
                        ),
                        size: Size.square(10.r),
                        color: AppColors.primary.withAlphaOpacity(0.2),
                        activeSize: Size.square(10.r),
                        activeColor: AppColors.primary,
                      ),
                    );
                  },
                ),
              ),
              BlocBuilder<OnboardingShowInfoCubit, int>(
                builder: (context, state) {
                  return GestureDetector(
                    onTap: () {
                      if (state < (pageCount - 1)) {
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        context.read<OnboardingCubit>().setOnBoardingValue(
                          showOnboardingValue: false,
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.all(AppSpacing.md.r),
                      decoration: BoxDecoration(
                        color: context.customTheme.primary,
                        borderRadius: AppBorderRadius.largeBorderRadius,
                      ),
                      child: SvgViewer.fromAsset(
                        path: AssetRoutes.arrowForwardIosIconPath,
                        size: 20.r,
                        colorFilter: ColorFilter.mode(
                          context.customTheme.onPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
