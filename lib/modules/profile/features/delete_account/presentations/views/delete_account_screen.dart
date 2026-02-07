import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/profile/profile.dart';

class DeleteAccountScreen extends StatelessWidget {
  const DeleteAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteAccountCubit(),
      child: const DeleteView(),
    );
  }
}

class DeleteView extends StatelessWidget {
  const DeleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state.appLoadingState.isFailure) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.error,
            message: state.error.isNullOrEmpty
                ? Messages.somethingWentWrong
                : state.error,
          );
        } else if (state.appLoadingState.isSuccess) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.success,
            message: "Account deleted successfully",
          );
          context.read<AuthBloc>().add(AuthLogoutButtonPressed());
          context.goNamed(Routes.login.name);
        } else if (state.appLoadingState.isLoading) {
          context.showPopupLoading();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: context.customTheme.backgroundPrimary,
          appBar: CustomAppBarWidget(
            showBackButton: true,
            title: ParentTextWidget(
              "Delete or Deativate Account",
              style: context.textTheme.bodyMedium?.copyWith(
                fontWeight: AppFontWeight.medium,
                color: context.customTheme.textPrimary,
              ),
            ),
            centerTitle: false,
          ),

          body: SingleChildScrollView(
            child: ParentPaddingWidget(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ParentTextWidget(
                    "Manage your account status. You can temporarily deactivate your account or permanently delete it.",
                    style: context.textTheme.bodyMedium?.copyWith(
                      fontWeight: AppFontWeight.medium,
                      color: context.customTheme.textPrimary,
                    ),
                  ),
                  AppGaps.gapH16,
                  DeleteTileContainer(),
                ],
              ),
            ),
          ),
          bottomNavigationBar: DeleteButton(),
        );
      },
    );
  }
}
