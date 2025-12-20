import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class SignupButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> globalKey;
  final TextEditingController addressController;
  final TextEditingController fullNameController;
  final TextEditingController phonenumberController;
  final TextEditingController passwordController;
  final TextEditingController verifyPasswordController;
  final TextEditingController emailController;
  const SignupButtonWidget({
    super.key,
    required this.globalKey,
    required this.addressController,
    required this.fullNameController,
    required this.phonenumberController,
    required this.passwordController,
    required this.verifyPasswordController,
    required this.emailController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      builder: (context, state) {
        return CustomButton(
          label: "Submit",
          labelStyle: context.textTheme.bodyMedium!.copyWith(
            color: context.customTheme.textInverse,
            fontWeight: AppFontWeight.semiBold,
          ),
          onTap: () async {
            if (globalKey.currentState!.validate()) {
              var countryPickerState = context.read<CountryPickerCubit>().state;
              var finalContactNumber =
                  "+${countryPickerState.phoneCode}-${phonenumberController.text}";
              context.read<SignupBloc>().add(
                SignupSubmitted(
                  email: emailController.text,
                  fullName: fullNameController.text,
                  phoneNumber: finalContactNumber,
                  address: addressController.text,
                  password: passwordController.text,
                ),
              );
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
