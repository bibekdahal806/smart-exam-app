import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupBloc()),

        BlocProvider(create: (context) => CountryPickerCubit()),
      ],
      child: SignupView(),
    );
  }
}

class SignupView extends StatelessWidget {
  final globalKey = GlobalKey<FormState>();
  final TextEditingController verifyEmailCodeController =
      TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phonenumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController verifyPasswordController =
      TextEditingController();
  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state.appLoadingState.isFailure) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.error,
            message: state.error ?? Messages.registerUserFailed,
          );
        } else if (state.appLoadingState.isSuccess) {
          context.hidePopupLoading();
          CustomSnackbar.showToastMessage(
            type: ToastType.success,
            message: Messages.registerUserSuccess,
          );
          context.goNamed(Routes.dashboard.name);
        } else if (state.appLoadingState.isLoading) {
          context.showPopupLoading();
        }
      },
      child: CommonAuthScreenLayout(
        child: ParentPaddingWidget(
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            mainAxisSize: .max,
            children: [
              ParentTextWidget(
                "Create an Account!",
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: AppFontWeight.bold,
                ),
              ),
              AppGaps.gapH4,
              ParentTextWidget(
                "Join us and start learning with us",
                style: context.textTheme.bodyLarge?.copyWith(
                  fontWeight: AppFontWeight.regular,
                ),
              ),
              AppGaps.gapH16,
              SignupFormContainer(
                globalKey: globalKey,
                fullNameController: fullNameController,
                phonenumberController: phonenumberController,
                passwordController: passwordController,
                verifyPasswordController: verifyPasswordController,
                addressController: addressController,
                emailController: emailController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
