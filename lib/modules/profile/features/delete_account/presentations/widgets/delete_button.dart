import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/delete_account/delete_account_cubit.dart';

class DeleteButton extends StatelessWidget {
  const DeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ParentPaddingWidget(
      hasSafeArea: true,
      top: 0,
      bottom: 4.r,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  label: "Cancel",
                  constraints: BoxConstraints(minHeight: 50.r, maxHeight: 50.r),
                  bgColor: context.customTheme.textPlaceholder,

                  labelStyle: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: AppFontWeight.regular,
                    color: context.customTheme.textInverse,
                  ),
                  onTap: () {
                    context.pop();
                  },
                ),
              ),
              AppGaps.gapWCustom(10.r),
              BlocBuilder<DeleteAccountCubit, DeleteAccountState>(
                builder: (context, state) {
                  return Expanded(
                    child: CustomButton(
                      label: "Continue",
                      constraints: BoxConstraints(
                        minHeight: 50.r,
                        maxHeight: 50.r,
                      ),
                      bgColor: context.customTheme.primary,
                      labelStyle: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: AppFontWeight.regular,
                        color: context.customTheme.textInverse,
                      ),
                      onTap: () async {
                        bool value = await DialogUtils.showConfirmationDialog(
                          context,
                          title: state.deleteType.isDeactivate
                              ? "Deactivate Account!"
                              : "Delete Account!",
                          message: state.deleteType.isDeactivate
                              ? "Are you sure you want to deactivate your account?"
                              : "Are you sure you want to delete your account?",
                          confirmText: "Yes",
                        );

                        if (value && context.mounted) {
                          context
                              .read<DeleteAccountCubit>()
                              .onDeleteAccountSubmitted();
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
