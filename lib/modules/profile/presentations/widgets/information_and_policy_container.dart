import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';
import 'package:url_launcher/url_launcher_string.dart';

class InformationAndPolicyContainer extends StatelessWidget {
  const InformationAndPolicyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGaps.gapH16,
        ProfileParentTile(
          title: "Information and Policies",
          children: [
            ProfileTile(
              title: "Terms & Conditions",
              onTap: () async {
                try {
                  await UrlHelper().launch(
                    Urls.termsService,
                    mode: LaunchMode.externalApplication,
                  );
                } catch (_) {}
              },
            ),
            ProfileTile(
              title: "Privacy Policy",
              onTap: () async {
                try {
                  await UrlHelper().launch(
                    Urls.privacyPolicy,
                    mode: LaunchMode.externalApplication,
                  );
                } catch (_) {}
              },
            ),
          ],
        ),
      ],
    );
  }
}
