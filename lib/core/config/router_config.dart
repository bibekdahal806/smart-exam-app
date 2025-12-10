import 'package:flutter/material.dart';
import 'package:q_bank/common/observers/navigation_observer.dart';
import 'package:q_bank/common/router/routes.dart';
import 'package:q_bank/common/widgets/error/error_screen.dart';
import 'package:q_bank/modules/dashboard/dashboard.dart';
import 'package:q_bank/modules/onboarding/onboarding.dart';
import 'package:go_router/go_router.dart';

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
      name: Routes.dashboard.name,
      path: Routes.dashboard.path,
      builder: (context, state) => const DashboardScreen(),
    ),

    //auth
  ],
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
    location: state.fullPath ?? state.matchedLocation,
  ),
);
