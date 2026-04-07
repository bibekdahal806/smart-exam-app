import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: const ChangePasswordView(),
    );
  }
}

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChangePasswordCubit, ChangePasswordState>(
      listener: (context, state) {
        if (state is ChangePasswordLoading) {
          context.showPopupLoading();
        } else if (state is ChangePasswordError) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.error,
            message: state.error,
          );
        } else if (state is ChangePasswordSuccess) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.success,
            message: Messages.changePasswordSuccess,
          );
          context.pop(true);
        }
      },
      child: Scaffold(
        backgroundColor: context.customTheme.backgroundPrimary,
        appBar: CustomAppBarWidget(
          showBackButton: true,
          title: ParentTextWidget(
            "Change Password",
            style: context.textTheme.bodyMedium?.copyWith(
              fontWeight: AppFontWeight.medium,
              color: context.customTheme.textPrimary,
            ),
          ),
          centerTitle: false,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: ParentPaddingWidget(child: ChangePasswordContainer()),
          ),
        ),
      ),
    );
  }
}
