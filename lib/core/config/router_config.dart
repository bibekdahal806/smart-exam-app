import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/observers/navigation_observer.dart';
import 'package:q_bank/common/router/routes.dart';
import 'package:q_bank/common/widgets/error/error_screen.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/dashboard/dashboard.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';
import 'package:q_bank/modules/profile/profile.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  observers: [AppNavigatorObserver()],
  redirect: (context, state) {
    return null;
  },
  routes: [
    //onboarding
    GoRoute(
      name: Routes.splash.name,
      path: Routes.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      name: Routes.onboarding.name,
      path: Routes.onboarding.path,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      name: Routes.login.name,
      path: Routes.login.path,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: Routes.signup.name,
      path: Routes.signup.path,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      name: Routes.dashboard.name,
      path: Routes.dashboard.path,
      builder: (context, state) => const DashboardScreen(),
    ),

    //profile
    GoRoute(
      path: Routes.editProfile.path,
      name: Routes.editProfile.name,
      builder: (context, state) => const EditProfileScreen(),
    ),

    GoRoute(
      path: Routes.deleteAccount.path,
      name: Routes.deleteAccount.name,
      builder: (context, state) => const DeleteAccountScreen(),
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
    location: state.fullPath ?? state.matchedLocation,
  ),
);
