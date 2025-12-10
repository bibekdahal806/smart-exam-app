import 'package:q_bank/core/core.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlHelper {
  Future<void> launch(String url, {LaunchMode? mode, Uri? fullUri}) async {
    final Uri uri = fullUri ?? Uri.parse(url);

    try {
      // Ensure the scheme can be launched
      if (!await canLaunchUrl(uri)) {
        throw ServerException(
          "This link cannot be opened. The app may not be installed or unsupported on your device.",
        );
      }

      final launched = await launchUrl(
        uri,
        mode: mode ?? LaunchMode.externalApplication,
      );

      if (!launched) {
        throw ServerException(
          "Failed to open the link. Please check your internet connection or device settings.",
        );
      }
    } catch (e) {
      throw ServerException(
        "Cannot launch URL. Please contact your app admin or check your internet connection.",
      );
    }
  }
}
