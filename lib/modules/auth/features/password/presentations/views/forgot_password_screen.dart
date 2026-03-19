import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(),
      child: ForgotPasswordView(),
    );
  }
}

class ForgotPasswordView extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
      listener: (context, forgetPasswordState) {
        if (forgetPasswordState is ForgetPasswordLoading) {
          context.showPopupLoading();
        } else if (forgetPasswordState is ForgetPasswordError) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.error,
            message: forgetPasswordState.error,
          );
        } else if (forgetPasswordState is ForgetPasswordSuccess) {
          context.hidePopupLoading();
          context.pop(true);
          CustomSnackbar.showToastMessage(
            type: ToastType.success,
            message: Messages.forgotPasswordSuccess,
            toastLength: Toast.LENGTH_LONG,
          );
        }
      },
      child: CommonAuthScreenLayout(
        child: ParentPaddingWidget(
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            mainAxisSize: .max,
            children: [
              AppGaps.gapH16,
              ForgotPasswordContainer(
                formKey: formKey,
                emailController: emailController,
              ),
            ],
          ),
        ),
      ),

      // Scaffold(
      //   appBar: CustomAppBarWidget(showBackButton: true),
      //   body: SingleChildScrollView(
      //     child: SafeArea(
      //       bottom: false,
      //       child: Column(
      //         children: [
      //           AuthAppLogoContainer(),

      //           16.verticalSpace,
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
