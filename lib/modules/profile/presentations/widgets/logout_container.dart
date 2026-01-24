import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/profile/profile.dart';

class LogoutContainer extends StatelessWidget {
  const LogoutContainer({super.key});

  Future<void> onLogout(BuildContext ctx) async {
    bool value = await DialogUtils.showConfirmationDialog(
      ctx,
      title: "Logout?",
      message: "Are you sure you want to logout?",
      confirmText: "Yes",
    );
    if (value && ctx.mounted) {
      ctx.read<AuthBloc>().add(AuthLogoutButtonPressed());
      ctx.goNamed(Routes.login.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return context.isAuthenticated
        ? Column(
            children: [
              AppGaps.gapH16,
              ProfileParentTile(
                title: "Authentication",
                children: [
                  ProfileTile(
                    title: "Logout",
                    onTap: () => onLogout(context),
                    hasDivider: false,
                  ),
                ],
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
