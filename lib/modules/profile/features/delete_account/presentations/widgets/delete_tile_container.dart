import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';

class DeleteTileContainer extends StatelessWidget {
  const DeleteTileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(AppSpacing.lg.r),
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.mediumBorderRadius,
      ),
      child: BlocBuilder<DeleteAccountCubit, DeleteAccountState>(
        builder: (context, state) {
          return RadioGroup(
            onChanged: (val) {
              context.read<DeleteAccountCubit>().onToggleDeleteType(val);
            },
            groupValue: state.deleteType,
            child: Column(
              children: [
                DeleteTile(
                  title: "Deactivate Account",
                  description:
                      "Deactivating your account will temporarily pause it, keeping your exam details and details intact. You won’t receive emails until you reactivate it.",
                  deleteType: DeleteType.deactivate,
                  selectedDeleteType: DeleteType.deactivate,
                  onChanged: (val) {
                    context.read<DeleteAccountCubit>().onToggleDeleteType(val);
                  },
                ),
                AppGaps.gapH12,
                Divider(color: AppColors.borderLight),
                AppGaps.gapH12,
                DeleteTile(
                  title: "Delete Account",
                  description:
                      "Deleting your account is permanent—you'll lose all order history, saved details with no option to recover.",
                  deleteType: DeleteType.delete,
                  selectedDeleteType: DeleteType.delete,
                  onChanged: (val) {
                    context.read<DeleteAccountCubit>().onToggleDeleteType(val);
                  },
                ),
                //
              ],
            ),
          );
        },
      ),
    );
  }
}
