import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class SignupFormContainer extends StatelessWidget {
  final GlobalKey<FormState> globalKey;
  final TextEditingController addressController;
  final TextEditingController fullNameController;
  final TextEditingController phonenumberController;
  final TextEditingController passwordController;
  final TextEditingController verifyPasswordController;
  final TextEditingController emailController;

  const SignupFormContainer({
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
    return Column(
      children: [
        TextfieldWithTitle(
          title: "Full Name",
          textField: CustomOutlinedTextField(
            hint: "",
            controller: fullNameController,
            autofillHints: [AutofillHints.name, AutofillHints.namePrefix],
            textCapitalization: TextCapitalization.none,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: Validators.checkFieldEmpty,
          ),
        ),
        AppGaps.gapH16,
        TextfieldWithTitle(
          title: "Email",
          textField: CustomOutlinedTextField(
            hint: "",
            controller: emailController,
            autofillHints: [AutofillHints.email],
            textCapitalization: TextCapitalization.none,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: Validators.checkEmailField,
          ),
        ),
        AppGaps.gapH16,
        TextfieldWithTitle(
          title: "Address",
          textField: CustomOutlinedTextField(
            hint: "",
            controller: addressController,
            autofillHints: [
              AutofillHints.addressCity,
              AutofillHints.addressState,
            ],
            textCapitalization: TextCapitalization.none,
            textInputType: TextInputType.name,
            textInputAction: TextInputAction.next,
            validator: Validators.checkFieldEmpty,
          ),
        ),
        AppGaps.gapH16,
        TextfieldWithTitle(
          title: "Mobile Number",
          textField: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CountryPickerTextfield(),
              AppGaps.gapW8,
              Expanded(
                child: CustomOutlinedTextField(
                  hint: "",
                  controller: phonenumberController,

                  textCapitalization: TextCapitalization.none,
                  textInputType: TextInputType.number,
                  autofillHints: [AutofillHints.telephoneNumber],
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.next,
                  validator: Validators.checkPhoneField,
                ),
              ),
            ],
          ),
        ),
        AppGaps.gapH16,
        TextfieldWithTitle(
          title: "Password",
          textField: CustomOutlinedPasswordTextField(
            hint: "",
            controller: passwordController,

            autofillHints: [AutofillHints.password],
            textCapitalization: TextCapitalization.none,
            textInputType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validator: Validators.checkPasswordField,
          ),
        ),
        AppGaps.gapH16,
        TextfieldWithTitle(
          title: "Confirm Password",
          textField: CustomOutlinedPasswordTextField(
            hint: "",
            controller: verifyPasswordController,
            autofillHints: [AutofillHints.password],
            textCapitalization: TextCapitalization.none,
            textInputType: TextInputType.visiblePassword,
            textInputAction: TextInputAction.done,
            validator: (verifyText) {
              return Validators.checkConfirmPassword(
                verifyText,
                passwordController.text,
              );
            },
          ),
        ),
        AppGaps.gapH24,
        SignupButtonWidget(
          globalKey: globalKey,
          emailController: emailController,
          passwordController: passwordController,
          fullNameController: fullNameController,
          addressController: addressController,
          phonenumberController: phonenumberController,
          verifyPasswordController: verifyPasswordController,
        ),
        AppGaps.gapH24,
        SignupLoginInfoWidget(),
        AppGaps.gapH24,
      ],
    );
  }
}
