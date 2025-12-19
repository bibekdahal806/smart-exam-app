import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginSignupInfoWidget extends StatelessWidget {
  const LoginSignupInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: AlignmentDirectional.bottomCenter,
          width: double.infinity,
          decoration: BoxDecoration(
            color: context.customTheme.backgroundPrimary,
          ),
          child: ParentPaddingWidget(
            left: AppSpacing.xlg.r,
            right: AppSpacing.xlg.r,
            bottom: 0,
            top: 0,
            hasSafeArea: true,
            child: RichText(
              text: TextSpan(
                text: "New to Dress Nepal? ",
                style: context.textTheme.bodySmall!.copyWith(
                  color: context.customTheme.textPrimary,
                  fontWeight: AppFontWeight.medium,
                ),
                children: [
                  TextSpan(
                    text: "Create an account",
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.customTheme.primary,
                      fontWeight: AppFontWeight.semiBold,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        context.replaceNamed(Routes.signup.name);
                      },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
