import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';

class AccountOrdermanagementContainer extends StatelessWidget {
  const AccountOrdermanagementContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isUnauthenticated
        ? SizedBox.shrink()
        : Column(
            children: [
              AppGaps.gapH16,
              ProfileParentTile(
                title: "Account & History",
                children: [ProfileTile(title: "My History", onTap: () {})],
              ),
            ],
          );
  }
}
