import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:q_bank/core/utils/helpers/dialog/confirmation_dialog.dart';

class PermissionHelper {
  static Future<Permission> getRequiredPermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return (androidInfo.version.sdkInt >= 33)
          ? Permission.photos
          : Permission.storage;
    } else {
      return Permission.photos; // Correct for iOS
    }
  }

  static Future<bool> handlePermissionFlow(BuildContext context) async {
    final permission = await getRequiredPermission();
    PermissionStatus status = await permission.status;

    // 1. Check if already granted (works for both platforms)
    if (status.isGranted) return true;

    // 2. iOS-specific handling
    if (Platform.isIOS) {
      // Handle first-time request
      if (status.isDenied) {
        status = await permission.request();

        // Check new status after request
        if (status.isGranted) return true;

        // Special case: iOS sometimes returns limited for photos
        if (status == PermissionStatus.limited) {
          return true; // Limited is acceptable for adding photos
        }
      }

      // 3. Handle permanent denial
      if (status.isPermanentlyDenied && context.mounted) {
        return await _showIOSPermissionDialog(context);
      }

      // 4. Handle initial denial case
      if (status.isDenied && context.mounted) {
        return await _showIOSPermissionDialog(context);
      }
    }
    // 5. Android handling remains the same
    else {
      if (status.isDenied) {
        status = await permission.request();
        if (status.isGranted) return true;
      }

      if (status.isPermanentlyDenied && context.mounted) {
        return await _showAndroidPermissionDialog(context);
      }
    }

    return false;
  }

  static Future<bool> _showIOSPermissionDialog(BuildContext context) async {
    final shouldProceed =
        await showDialog<bool>(
          context: context,
          builder: (context) => ConfirmationDialog(
            title: 'Add Photos Access Needed',
            message:
                'Rudraksh needs "Add Photos Only" access to save QR codes. '
                'Please enable it in Settings.',
            confirmText: 'Open Settings',
            showCancelButton: true,
          ),
        ) ??
        false;

    if (shouldProceed) {
      await openAppSettings();
      final status = await Permission.photos.status;
      return status.isGranted || status == PermissionStatus.limited;
    }
    return false;
  }

  static Future<bool> _showAndroidPermissionDialog(BuildContext context) async {
    final shouldProceed =
        await showDialog<bool>(
          context: context,
          builder: (context) => ConfirmationDialog(
            title: 'Photo Access Needed',
            message: Platform.isIOS
                ? 'Rudraksh needs access to your Photos to save QR codes. '
                      'Please enable "Add Photos Only" access in settings.'
                : 'Rudraksh needs access to your storage to save QR codes. '
                      'Please grant permission in settings.',
            confirmText: 'Open Settings',
            showCancelButton: true,
          ),
        ) ??
        false;

    if (shouldProceed) {
      await openAppSettings();
      final permission = await getRequiredPermission();
      return (await permission.status).isGranted;
    }
    return false;
  }
}
