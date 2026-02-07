import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.formKey,
    required this.phoneNumberController,
    required this.emailController,
    required this.nameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    final titleStyle = context.textTheme.bodyMedium?.copyWith(
      fontWeight: AppFontWeight.semiBold,
      color: context.customTheme.textPrimary,
    );
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          TextfieldWithTitle(
            title: "First Name",
            titleStyle: titleStyle,
            textField: CustomOutlinedTextField(
              hint: "",
              controller: nameController,
              textInputAction: TextInputAction.next,
              textCapitalization: TextCapitalization.none,
              textInputType: TextInputType.name,
              validator: Validators.checkFieldEmpty,
            ),
          ),
          AppGaps.gapH16,
          TextfieldWithTitle(
            title: "Email",
            titleStyle: titleStyle,
            textField: CustomOutlinedTextField(
              hint: "",
              controller: emailController,
              textCapitalization: TextCapitalization.none,
              textInputType: TextInputType.emailAddress,
              readOnly: true,
              textInputAction: TextInputAction.next,
              validator: Validators.checkEmailField,
            ),
          ),
          AppGaps.gapH16,
          TextfieldWithTitle(
            title: "Contact Number",
            titleStyle: titleStyle,
            textField: Row(
              crossAxisAlignment: .start,
              children: [
                CountryPickerTextfield(),
                AppGaps.gapW8,
                Expanded(
                  child: CustomOutlinedTextField(
                    hint: "",
                    controller: phoneNumberController,
                    textCapitalization: TextCapitalization.none,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.number,
                    validator: Validators.checkPhoneField,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
