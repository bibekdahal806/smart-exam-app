import 'package:flutter/material.dart';
import 'package:q_bank/core/utils/utils.dart';

//for showing dialog. will return true if confirmed and false if cancled
class DialogUtils {
  const DialogUtils._();

  static Future<bool> showConfirmationDialog(
    BuildContext context, {
    Color? backgroundColor,
    required String title,
    TextStyle? titleTextStyle,
    required String message,
    TextStyle? messageTextStyle,
    bool? showCancelButton,
    Widget? cancelButton,
    required String confirmText,
    TextStyle? confirmTextStyle,

    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          useSafeArea: useSafeArea,
          useRootNavigator: useRootNavigator,
          routeSettings: routeSettings,
          anchorPoint: anchorPoint,
          traversalEdgeBehavior: traversalEdgeBehavior,
          builder: (context) => ConfirmationDialog(
            backgroundColor: backgroundColor,
            title: title,
            titleTextStyle: titleTextStyle,
            message: message,
            messageTextStyle: messageTextStyle,
            confirmText: confirmText,
            confirmTextStyle: confirmTextStyle,
            showCancelButton: showCancelButton,
            cancelButton: cancelButton,
          ),
        ) ??
        false;
  }

  static Future<bool> showInformationDialog(
    BuildContext context, {
    Color? backgroundColor,
    required String title,
    TextStyle? titleTextStyle,
    required String message,
    TextStyle? messageTextStyle,
    bool? showCancelButton,
    Widget? cancelButton,
    required String confirmText,
    TextStyle? confirmTextStyle,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = false,
    RouteSettings? routeSettings,
    Offset? anchorPoint,
    TraversalEdgeBehavior? traversalEdgeBehavior,
  }) async {
    return await showDialog<bool>(
          context: context,
          barrierDismissible: barrierDismissible,
          barrierColor: barrierColor,
          barrierLabel: barrierLabel,
          useSafeArea: useSafeArea,
          useRootNavigator: useRootNavigator,
          routeSettings: routeSettings,
          anchorPoint: anchorPoint,
          traversalEdgeBehavior: traversalEdgeBehavior,
          builder: (context) => ConfirmationDialog(
            backgroundColor: backgroundColor,
            title: title,
            titleTextStyle: titleTextStyle,
            message: message,
            messageTextStyle: messageTextStyle,
            confirmText: confirmText,
            confirmTextStyle: confirmTextStyle,
            showCancelButton: false,
            cancelButton: cancelButton,
          ),
        ) ??
        false;
  }
}
