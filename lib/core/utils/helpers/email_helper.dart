import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/device_info/device_info.dart';
import 'package:q_bank/modules/package_info/package_info.dart';

class EmailHelper {
  static Future<void> sendEmail({
    required BuildContext context,
    required String subject,
    required String recipientEmail,
    String? additionalBody, // For adding extra details
  }) async {
    try {
      // Initialize details list
      List<String> deviceDetails = [];

      // Collect device-related info
      final deviceState = context.read<DeviceInfoCubit>().state;
      final info = deviceState.deviceInfo;
      if (info is AndroidDeviceInfo) {
        deviceDetails.add(
          "Device: ${info.brand} ${info.model}\n"
          "OS: Android ${info.version.release} (API ${info.version.sdkInt})",
        );
      } else if (info is IosDeviceInfo) {
        deviceDetails.add(
          "Device: ${info.name} ${info.model}\n"
          "OS: iOS ${info.systemVersion}",
        );
      } else if (info is MacOsDeviceInfo) {
        deviceDetails.add(
          "Device: ${info.computerName}\n"
          "OS: macOS ${info.osRelease}",
        );
      } else if (info is WindowsDeviceInfo) {
        deviceDetails.add(
          "Device: ${info.computerName}\n"
          "OS: Windows ${info.majorVersion}.${info.minorVersion} (Build ${info.buildNumber})",
        );
      } else if (info is LinuxDeviceInfo) {
        deviceDetails.add(
          "Device: ${info.name}\n"
          "OS: Linux ${info.versionId}",
        );
      } else if (info is WebBrowserInfo) {
        deviceDetails.add(
          "Browser: ${info.browserName}\n"
          "User Agent: ${info.userAgent ?? 'N/A'}",
        );
      } else {
        deviceDetails.add("Device: Unknown Platform");
      }

      // APP INFO
      final packageInfo = context.read<PackageInfoCubit>().state.packageInfo;
      if (packageInfo != null) {
        deviceDetails.add(
          "App Version: ${packageInfo.version} (${packageInfo.buildNumber})",
        );
      }

      // Additional details
      if (additionalBody != null && additionalBody.isNotEmpty) {
        deviceDetails.add("\n$additionalBody");
      }

      final body = deviceDetails.join("\n");

      final Uri params = Uri(
        scheme: 'mailto',
        path: recipientEmail,
        query: 'subject=$subject&body=$body',
      );

      await UrlHelper().launch(params.toString());
    } catch (e) {
      rethrow;
    }
  }
}
