import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';
import 'package:q_bank/modules/user/user.dart';

class EditProfileButton extends StatelessWidget {
  const EditProfileButton({
    super.key,
    required this.formKey,
    required this.nameController,
    required this.emailController,
    required this.phoneNumberController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return CustomButton(
          label: "Update",
          labelStyle: context.textTheme.bodyMedium!.copyWith(
            color: context.customTheme.textInverse,
            fontWeight: AppFontWeight.semiBold,
          ),
          onTap: () {
            if (formKey.currentState!.validate()) {
              var countryCode = context
                  .read<CountryPickerCubit>()
                  .state
                  .phoneCode;
              var finalContactNumber =
                  "+$countryCode-${phoneNumberController.text}";
              UserEntity userEntity = UserEntity(
                name: nameController.text,
                phone: finalContactNumber,
              );
              var imagePath = context
                  .read<ImagePickerCubit>()
                  .state
                  .files
                  .firstOrNull
                  ?.path;
              context.read<EditProfileCubit>().onSubmit(
                userEntity: userEntity,
                imagePath: imagePath,
              );
            }
          },
          constraints: BoxConstraints.expand(
            height: 50.r,
            width: double.infinity,
          ),
        );
      },
    );
  }
}
