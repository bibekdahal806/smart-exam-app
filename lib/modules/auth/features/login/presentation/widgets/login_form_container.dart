import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class LoginFormContainer extends StatelessWidget {
  final GlobalKey<FormState> globalKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginFormContainer({
    required this.emailController,
    required this.passwordController,
    required this.globalKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          AppGaps.gapH16,
          LoginForm(
            formKey: globalKey,
            emailController: emailController,
            passwordController: passwordController,
          ),
          AppGaps.gapH8,
          RememberForgetPasswordWidget(),
          AppGaps.gapH16,
          LoginButtonWidget(
            formKey: globalKey,
            emailController: emailController,
            passwordController: passwordController,
          ),

          AppGaps.gapH24,
          LoginSignupInfoWidget(),
          AppGaps.gapH24,
        ],
      ),
    );
  }
}
