import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

class ChangePasswordContainer extends HookWidget {
  const ChangePasswordContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final currentPasswordController = useTextEditingController();
    final newPasswordController = useTextEditingController();
    final confirmNewPasswordController = useTextEditingController();

    String? validateNewPassword(String? value) {
      final passwordValidation = Validators.checkPasswordField(value);
      if (passwordValidation != null) {
        return passwordValidation;
      }

      if (value?.trim() == currentPasswordController.text.trim()) {
        return Messages.samePassword;
      }

      return null;
    }

    return Container(
      padding: .all(AppSpacing.baseSpacing.r),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.largeBorderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ParentTextWidget(
            'Security',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.customTheme.textPrimary,
              fontWeight: AppFontWeight.semiBold,
            ),
          ),
          AppGaps.gapH4,
          ParentTextWidget(
            'Update your password using your current password and a new secure password.',
            style: context.textTheme.bodySmall?.copyWith(
              color: context.customTheme.icon,
              fontWeight: AppFontWeight.regular,
            ),
          ),
          AppGaps.gapH24,
          Form(
            key: formKey,
            child: Column(
              children: [
                TextfieldWithTitle(
                  title: "Current Password",
                  textField: CustomOutlinedPasswordTextField(
                    hint: "Enter current password",
                    controller: currentPasswordController,
                    autofillHints: const [AutofillHints.password],
                    textCapitalization: TextCapitalization.none,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    validator: Validators.checkPasswordField,
                  ),
                ),
                AppGaps.gapH16,
                TextfieldWithTitle(
                  title: "New Password",
                  textField: CustomOutlinedPasswordTextField(
                    hint: "Enter new password",
                    controller: newPasswordController,
                    autofillHints: const [AutofillHints.newPassword],
                    textCapitalization: TextCapitalization.none,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.next,
                    validator: validateNewPassword,
                  ),
                ),
                AppGaps.gapH16,
                TextfieldWithTitle(
                  title: "Confirm New Password",
                  textField: CustomOutlinedPasswordTextField(
                    hint: "Re-enter new password",
                    controller: confirmNewPasswordController,
                    autofillHints: const [AutofillHints.newPassword],
                    textCapitalization: TextCapitalization.none,
                    textInputType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.done,
                    validator: (value) => Validators.checkConfirmPassword(
                      value,
                      newPasswordController.text,
                    ),
                    onSubmitted: (_) {
                      if (formKey.currentState?.validate() ?? false) {
                        context
                            .read<ChangePasswordCubit>()
                            .changePasswordSubmitted(
                              currentPassword: currentPasswordController.text
                                  .trim(),
                              newPassword: newPasswordController.text.trim(),
                              confirmNewPassword: confirmNewPasswordController
                                  .text
                                  .trim(),
                            );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          AppGaps.gapH24,
          CustomButton(
            label: "Update Password",
            labelStyle: context.textTheme.bodyMedium?.copyWith(
              color: context.customTheme.textInverse,
              fontWeight: AppFontWeight.semiBold,
            ),
            onTap: () {
              if (formKey.currentState?.validate() ?? false) {
                context.read<ChangePasswordCubit>().changePasswordSubmitted(
                  currentPassword: currentPasswordController.text.trim(),
                  newPassword: newPasswordController.text.trim(),
                  confirmNewPassword: confirmNewPasswordController.text.trim(),
                );
              }
            },
            constraints: BoxConstraints.expand(height: 50.r),
          ),
        ],
      ),
    );
  }
}
