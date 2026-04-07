import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/observers/navigation_observer.dart';
import 'package:q_bank/common/router/routes.dart';
import 'package:q_bank/common/widgets/error/error_screen.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/dashboard/dashboard.dart';
import 'package:q_bank/modules/exam/exam.dart';
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
      name: Routes.forgetPassword.name,
      path: Routes.forgetPassword.path,
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      name: Routes.changePassword.name,
      path: Routes.changePassword.path,
      builder: (context, state) => const ChangePasswordScreen(),
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
    GoRoute(
      name: Routes.exam.name,
      path: Routes.exam.path,

      builder: (context, state) {
        if (state.extra == null || state.extra is! ExamScreenArgument) {
          return ErrorScreen(
            error: "Exam detail is needed here.",
            location: state.fullPath ?? state.matchedLocation,
          );
        }
        final args = state.extra as ExamScreenArgument;
        return ExamScreen(argument: args);
      },
    ),
    GoRoute(
      name: Routes.examDetail.name,
      path: Routes.examDetail.path,
      builder: (context, state) {
        if (state.extra == null || state.extra is! ExamDetailArgument) {
          return ErrorScreen(
            error: "Exam detail is needed here.",
            location: state.fullPath ?? state.matchedLocation,
          );
        }
        final args = state.extra as ExamDetailArgument;
        return ExamDetailScreen(argument: args);
      },
    ),
    GoRoute(
      path: Routes.pendingExams.path,
      name: Routes.pendingExams.name,
      builder: (context, state) => const PendingExamsScreen(),
    ),
    GoRoute(
      path: Routes.examReports.path,
      name: Routes.examReports.name,
      builder: (context, state) => ExamReportScreen(),
    ),
    GoRoute(
      path: Routes.examReportDetail.path,
      name: Routes.examReportDetail.name,
      builder: (context, state) {
        if (state.extra == null || state.extra is! ExamReportDetailArgument) {
          return ErrorScreen(
            error: "Exam detail is needed here.",
            location: state.fullPath ?? state.matchedLocation,
          );
        }
        final args = state.extra as ExamReportDetailArgument;
        return ExamReportDetailScreen(argument: args);
      },
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(
    error: state.error.toString(),
    location: state.fullPath ?? state.matchedLocation,
  ),
);
