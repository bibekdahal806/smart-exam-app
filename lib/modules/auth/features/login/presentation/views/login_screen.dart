import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => LoginBloc(), child: LoginView());
  }
}

class LoginView extends StatelessWidget {
  final globalKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.appLoadingState.isFailure) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.error,
            message: state.error ?? Messages.somethingWentWrong,
          );
        } else if (state.appLoadingState.isSuccess) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.success,
            message: Messages.loginSuccess,
          );
          context.goNamed(Routes.dashboard.name);
        } else if (state.appLoadingState.isLoading) {
          context.showPopupLoading();
        }
      },
      child: CommonAuthScreenLayout(
        child: ParentPaddingWidget(
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            mainAxisSize: .max,
            children: [
              ParentTextWidget(
                "Hi, Welcome Back! 👋",
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              AppGaps.gapH4,
              ParentTextWidget(
                "Hello again, you've been missed.",
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: AppFontWeight.regular,
                ),
              ),
              AppGaps.gapH16,
              LoginFormContainer(
                globalKey: globalKey,
                emailController: emailController,
                passwordController: passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
