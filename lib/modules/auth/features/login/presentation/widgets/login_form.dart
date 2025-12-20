import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextfieldWithTitle(
            title: "Email",
            textField: CustomOutlinedTextField(
              hint: "",
              controller: emailController,
              // fillColor: context.customTheme.info,
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
          AppGaps.gapH16,
          TextfieldWithTitle(
            title: "Password",
            textField: CustomOutlinedPasswordTextField(
              hint: "",
              controller: passwordController,
              // fillColor: context.customTheme.input,
              autofillHints: [AutofillHints.password],
              textCapitalization: TextCapitalization.none,
              textInputType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              validator: Validators.checkPasswordField,
            ),
          ),
        ],
      ),
    );
  }
}
