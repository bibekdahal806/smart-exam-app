import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CountryPickerCubit()),
        BlocProvider(
          create: (context) =>
              getIt<ImagePickerCubit>()
                ..setImagePickerStatus(isSingleImagePicker: true),
        ),
        BlocProvider(create: (context) => EditProfileCubit()),
      ],
      child: const EditProfileView(),
    );
  }
}

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state.appLoadingState.isFailure) {
          context.hidePopupLoading();
          if (state.error.isNullOrEmpty) {
            return;
          }
          CustomSnackbar.showToastMessage(
            type: ToastType.error,
            message: state.error.isNullOrEmpty
                ? "Something went wrong"
                : state.error,
          );
          context.read<EditProfileCubit>().clearErrror();
        } else if (state.appLoadingState.isSuccess) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.success,
            message: "Profile Edited successfully",
          );
          context.pop();
        } else if (state.appLoadingState.isLoading) {
          context.showPopupLoading();
        }
      },
      child: Scaffold(
        backgroundColor: context.customTheme.backgroundPrimary,
        appBar: CustomAppBarWidget(
          showBackButton: true,
          title: ParentTextWidget(
            "Edit Profile",
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: AppFontWeight.medium,
              color: context.customTheme.textPrimary,
            ),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ParentPaddingWidget(child: EditProfileFormContainer()),
          ),
        ),
      ),
    );
  }
}
