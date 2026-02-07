import 'package:flutter/material.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/profile/profile.dart';

class SupportFeedback extends StatelessWidget {
  SupportFeedback({super.key});
  final InAppReview inAppReview = InAppReview.instance;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppGaps.gapH16,
        ProfileParentTile(
          title: "Support and Feedback",
          children: [
            ProfileTile(
              title: "Report",
              onTap: () async {
                try {
                  await EmailHelper.sendEmail(
                    context: context,
                    subject: 'Report from user',
                    recipientEmail: Urls.contactEmail,
                  );
                } on AppException catch (e) {
                  if (context.mounted) {
                    CustomSnackbar.showToastMessage(
                      message: e.message,
                      type: ToastType.error,
                    );
                  }
                } catch (e) {
                  if (context.mounted) {
                    CustomSnackbar.showToastMessage(
                      message: e.toString(),
                      type: ToastType.error,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
