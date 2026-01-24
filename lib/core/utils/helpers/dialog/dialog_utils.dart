import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_bank/common/common.dart';
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

  static Future showImagePicker({
    required BuildContext context,
    required ImagePickerCubit imagePickerCubit,
    bool shouldPickMultipleImages = false,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return BlocProvider.value(
          value: imagePickerCubit,
          child: BottomSheet(
            showDragHandle: true,
            onClosing: () {},
            enableDrag: false,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    onTap: () async {
                      context
                          .read<ImagePickerCubit>()
                          .captureImage()
                          .whenComplete(() {
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          });
                    },
                    leading: const CircleAvatar(
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                    title: const Text("Capture an image"),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  ListTile(
                    onTap: shouldPickMultipleImages
                        ? () async {
                            context
                                .read<ImagePickerCubit>()
                                .pickMultipleImages()
                                .whenComplete(() {
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                });
                          }
                        : () async {
                            context
                                .read<ImagePickerCubit>()
                                .pickImage()
                                .whenComplete(() {
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                });
                          },
                    leading: const CircleAvatar(
                      child: Icon(Icons.create_new_folder_outlined),
                    ),
                    title: const Text("Choose from device"),
                    trailing: const Icon(Icons.chevron_right),
                  ),
                  const SizedBox(height: 30),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
