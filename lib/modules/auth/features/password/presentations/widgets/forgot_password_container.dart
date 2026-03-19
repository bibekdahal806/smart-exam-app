import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class ForgotPasswordContainer extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  const ForgotPasswordContainer({
    super.key,
    required this.emailController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ParentTextWidget(
          "Reset your password",
          style: context.textTheme.headlineSmall?.copyWith(
            color: context.customTheme.textPrimary,
            fontWeight: AppFontWeight.bold,
          ),
          textAlign: .center,
        ),
        4.verticalSpace,
        ParentTextWidget(
          "No worries, we'll send you a reset link to your email.",
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.customTheme.textSecondary,
            fontWeight: AppFontWeight.medium,
          ),
          textAlign: .center,
        ),
        24.verticalSpace,
        Form(
          key: formKey,
          child: TextfieldWithTitle(
            title: "Email",
            textField: CustomOutlinedTextField(
              hint: "Enter your email",
              controller: emailController,
              autofillHints: [
                AutofillHints.newUsername,
                AutofillHints.username,
                AutofillHints.email,
              ],
              textCapitalization: TextCapitalization.none,
              textInputType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: Validators.checkEmailField,
            ),
          ),
        ),
        16.verticalSpace,
        CustomButton(
          label: "Send Reset Link",
          labelStyle: context.textTheme.bodyMedium!.copyWith(
            color: context.customTheme.textInverse,
            fontWeight: AppFontWeight.semiBold,
          ),
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<ForgetPasswordCubit>().forgetPasswordSubmitted(
                email: emailController.text,
              );
            }
          },
          constraints: BoxConstraints.expand(height: 50.r),
        ),
      ],
    );
  }
}
