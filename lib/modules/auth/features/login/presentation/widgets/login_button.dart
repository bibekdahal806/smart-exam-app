import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginButtonWidget({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return CustomButton(
          label: "Sign In",
          labelStyle: context.textTheme.bodyMedium!.copyWith(
            color: context.customTheme.textInverse,
            fontWeight: AppFontWeight.semiBold,
          ),
          onTap: () async {
            if (formKey.currentState!.validate()) {
              context.read<LoginBloc>().add(
                LoginWithEmailPasswordSubmitted(
                  email: emailController.text,
                  password: passwordController.text,
                ),
              );

              if (state.isRememberMe) {
                TextInput.finishAutofillContext(shouldSave: true);
              }
            }
          },
          constraints: BoxConstraints.expand(
            height: 50.h,
            width: double.infinity,
          ),
        );
      },
    );
  }
}
