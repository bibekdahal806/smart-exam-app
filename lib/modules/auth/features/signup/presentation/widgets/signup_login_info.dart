import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class SignupLoginInfoWidget extends StatelessWidget {
  const SignupLoginInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "Already have an account? ",
        style: context.textTheme.bodySmall!.copyWith(
          color: context.customTheme.textPrimary,
          fontWeight: AppFontWeight.medium,
        ),
        children: [
          TextSpan(
            text: "Login",
            style: context.textTheme.bodySmall!.copyWith(
              color: context.colorScheme.primary,
              fontWeight: AppFontWeight.bold,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.replaceNamed(Routes.login.name);
              },
          ),
        ],
      ),
    );
  }
}
