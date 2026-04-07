import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';

class AccountSettingsContainer extends StatelessWidget {
  const AccountSettingsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isUnauthenticated
        ? SizedBox.shrink()
        : Column(
            children: [
              AppGaps.gapH16,
              ProfileParentTile(
                title: "Account Settings",
                children: [
                  ProfileTile(
                    title: "Change Password",
                    onTap: () {
                      context.pushNamed(Routes.changePassword.name);
                    },
                  ),
                  ProfileTile(
                    title: "Delete or Deactivate Account",
                    onTap: () {
                      // goto => delete/deacrivate screen.
                      context.pushNamed(Routes.deleteAccount.name);
                    },
                  ),
                ],
              ),
            ],
          );
  }
}
