import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/utils/utils.dart';
import 'package:q_bank/modules/auth/auth.dart';

class AuthListnerWidget extends StatelessWidget {
  final Widget child;

  const AuthListnerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) =>
          current is AuthUserAuthenticated &&
          previous is! AuthUserAuthenticated,
      listener: (context, state) {
        switch (state) {
          case AuthUserAuthenticated():
            // User just logged in
            CustomSnackbar.showToastMessage(
              type: ToastType.info,
              message: "Welcome back, ${state.user.firstName}!",
            );

            break;
          case AuthUserUnauthenticated():
            // User just logged out
            CustomSnackbar.showToastMessage(
              type: ToastType.info,
              message: "You have been logged out",
            );
            break;
          case AuthInitial():
            break;
        }
      },
      child: child,
    );
  }
}
