import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashCubit>(
      create: (context) => SplashCubit()..splashCompleter(),
      child: SplashScreenView(),
    );
  }
}

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) async {
        if (state.splashStatus.isSuccess) {
          if (context.mounted) {
            // var appSettingCubitState = context.read<AppSettingCubit>().state;
            var authState = context.read<AuthBloc>().state;
            if (authState is AuthUserUnauthenticated) {
              context.goNamed(Routes.login.name);
            } else {
              context.goNamed(Routes.dashboard.name);
            }
            // if (appSettingCubitState.showOnboarding) {
            //   context.goNamed(Routes.onboarding.name);
            // } else {
            //   if (authState is AuthUserUnauthenticated) {
            //     context.goNamed(Routes.login.name);
            //   } else {
            //     context.goNamed(Routes.dashboard.name);
            //   }
            // }
          }
        }
      },
      child: Scaffold(
        body: ParentPaddingWidget(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                // Container(
                //   padding: EdgeInsets.all(AppSpacing.xlg.r),
                //   decoration: BoxDecoration(
                //     color: context.customTheme.secondary,
                //     borderRadius: AppBorderRadius.chipBorderRadius,
                //   ),
                //   child: SizedBox.square(
                //     dimension: 140.r,
                //     child: SvgViewer.fromAsset(
                //       path: "AssetRoutes.appLogo",
                //       height: 125.h,
                //       width: 125.w,
                //     ),
                //   ),
                // ),
                Animate(
                  effects: [FadeEffect(), ScaleEffect()],
                  child: ParentTextWidget(
                    AppConstants.appName,
                    style: context.textTheme.displaySmall?.copyWith(
                      fontWeight: AppFontWeight.extraBold,
                      color: context.colorScheme.primary,
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: context.deviceWidth * 0.4,
                  child: LinearProgressIndicator(minHeight: 3.h),
                ),
                AppGaps.gapH8,
                Text(
                  "Loading...",
                  style: context.textTheme.labelMedium
                      ?.copyWith(
                        color: context.colorScheme.primary,
                        fontWeight: AppFontWeight.semiBold,
                      )
                      .scaleTextStyleForLocale,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
