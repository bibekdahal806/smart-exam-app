import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:q_bank/common/themes/typography/font_weight.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/core/utils/extensions/theme/app_theme_extension.dart';
import 'package:go_router/go_router.dart';

//for showing the alert dialog in the app for confirmation. Will return true if confirmed, false if cancelled
class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    this.showCancelButton,
    this.backgroundColor,
    this.titleTextStyle,
    this.messageTextStyle,
    this.cancelButton,
    this.confirmTextStyle,
  });

  final Color? backgroundColor;
  final String title;
  final TextStyle? titleTextStyle;
  final String message;
  final TextStyle? messageTextStyle;
  final bool? showCancelButton;
  final Widget? cancelButton;
  final String confirmText;
  final TextStyle? confirmTextStyle;

  @override
  Widget build(BuildContext context) {
    return !kIsWeb && Platform.isIOS
        ? IosConfirmationDialog(
            backgroundColor: backgroundColor,
            title: title,
            titleTextStyle: titleTextStyle,
            message: message,
            messageTextStyle: messageTextStyle,
            confirmText: confirmText,
            confirmTextStyle: confirmTextStyle,
            showCancelButton: showCancelButton ?? true,
            cancelButton: cancelButton,
          )
        : AndroidConfirmationDialog(
            backgroundColor: backgroundColor,
            title: title,
            titleTextStyle: titleTextStyle,
            message: message,
            messageTextStyle: messageTextStyle,
            confirmText: confirmText,
            confirmTextStyle: confirmTextStyle,
            showCancelButton: showCancelButton ?? true,
            cancelButton: cancelButton,
          );
  }
}

class AndroidConfirmationDialog extends StatelessWidget {
  const AndroidConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.showCancelButton,
    this.backgroundColor,
    this.titleTextStyle,
    this.messageTextStyle,
    this.cancelButton,
    this.confirmTextStyle,
  });

  final Color? backgroundColor;
  final String title;
  final TextStyle? titleTextStyle;
  final String message;
  final TextStyle? messageTextStyle;
  final bool showCancelButton;
  final Widget? cancelButton;
  final String confirmText;
  final TextStyle? confirmTextStyle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor ?? context.customTheme.backgroundPrimary,
      title: Text(
        title,
        style:
            titleTextStyle ??
            context.textTheme.bodyLarge
                ?.copyWith(fontWeight: AppFontWeight.bold)
                .scaleTextStyleForLocale,
      ),
      content: Text(
        message,
        textAlign: TextAlign.justify,
        style:
            messageTextStyle ??
            context.textTheme.bodyMedium
                ?.copyWith(fontWeight: AppFontWeight.regular)
                .scaleTextStyleForLocale,
      ),
      actions: [
        if (showCancelButton)
          cancelButton ??
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: context.colorScheme.onSurface,
                ),
                onPressed: () => context.pop(),
                child: Text(
                  'Cancel',
                  style: context.textTheme.bodySmall
                      ?.copyWith(fontWeight: AppFontWeight.semiBold)
                      .scaleTextStyleForLocale,
                ),
              ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: context.colorScheme.onSurface,
          ),
          onPressed: () => context.pop(true),
          child: Text(
            confirmText,
            style:
                confirmTextStyle ??
                context.textTheme.bodySmall
                    ?.copyWith(fontWeight: AppFontWeight.semiBold)
                    .scaleTextStyleForLocale,
          ),
        ),
      ],
    );
  }
}

class IosConfirmationDialog extends StatelessWidget {
  const IosConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.showCancelButton,
    this.backgroundColor,
    this.titleTextStyle,
    this.messageTextStyle,
    this.cancelButton,
    this.confirmTextStyle,
  });

  final Color? backgroundColor;
  final String title;
  final TextStyle? titleTextStyle;
  final String message;
  final TextStyle? messageTextStyle;
  final bool showCancelButton;
  final Widget? cancelButton;
  final String confirmText;
  final TextStyle? confirmTextStyle;

  @override
  Widget build(BuildContext context) {
    const OutlinedBorder buttonShape = RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    );

    return CupertinoTheme(
      data: CupertinoThemeData(
        scaffoldBackgroundColor:
            backgroundColor ?? context.customTheme.backgroundPrimary,
        brightness: context.selectedTheme == ThemeMode.dark
            ? Brightness.dark
            : Brightness.light,
      ),
      child: CupertinoAlertDialog(
        title: Text(
          title,
          style:
              titleTextStyle ??
              context.textTheme.bodyLarge
                  ?.copyWith(fontWeight: AppFontWeight.bold)
                  .scaleTextStyleForLocale,
        ),
        content: Text(
          message,
          textAlign: TextAlign.justify,
          style:
              messageTextStyle ??
              context.textTheme.bodyMedium
                  ?.copyWith(fontWeight: AppFontWeight.regular)
                  .scaleTextStyleForLocale,
        ),
        actions: [
          if (showCancelButton)
            cancelButton ??
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: context.colorScheme.onSurface,
                    shape: buttonShape,
                  ),
                  onPressed: () => context.pop(),
                  child: Text(
                    'Cancel',
                    style: context.textTheme.bodySmall
                        ?.copyWith(fontWeight: AppFontWeight.semiBold)
                        .scaleTextStyleForLocale,
                  ),
                ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: context.colorScheme.onSurface,
              shape: buttonShape,
            ),
            onPressed: () => context.pop(true),
            child: Text(
              confirmText,
              style:
                  confirmTextStyle ??
                  context.textTheme.bodySmall
                      ?.copyWith(fontWeight: AppFontWeight.semiBold)
                      .scaleTextStyleForLocale,
            ),
          ),
        ],
      ),
    );
  }
}
