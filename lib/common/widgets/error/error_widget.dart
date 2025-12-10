import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class ErrorScreenWidget extends StatelessWidget {
  final Widget? imageWidget;
  final String? svgImagePath;

  final String? errorTitle;
  final TextStyle? errorTextStyle;
  final String? errorDescription;
  final TextStyle? errorDescriptionTextStyle;
  final bool showButton;
  final Widget? iconWidget;
  final bool showAnotherButton;
  final Widget? anotherButtonGap;
  final Widget? anotherButton;
  final String? buttonText;
  final VoidCallback? onButtonTap;
  final Widget? buttonInsideWidget;
  const ErrorScreenWidget({
    super.key,
    this.imageWidget,
    this.svgImagePath,
    this.errorTitle,
    this.errorDescription,
    this.showButton = true,
    this.showAnotherButton = false,
    this.anotherButtonGap,
    this.anotherButton,
    this.buttonText,
    this.onButtonTap,
    this.buttonInsideWidget,
    this.errorTextStyle,
    this.errorDescriptionTextStyle,

    this.iconWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // imageWidget ?? Image.asset(AssetRoutes.errorImage),
          imageWidget ??
              SvgViewer.fromAsset(
                path: svgImagePath ?? AssetRoutes.errorFolderIconPath,
                size: 160.r,
              ),
          AppGaps.gapH8,
          ParentTextWidget(
            errorTitle ?? "Oops! Something went wrong",
            style:
                errorTextStyle ??
                context.textTheme.titleLarge?.copyWith(
                  color: context.customTheme.textSecondary,
                  fontFamily: AppConstants.englishFont,
                ),
            textAlign: TextAlign.center,
          ),

          if (errorDescription != null) ...[
            AppGaps.gapH8,
            Text(
              errorDescription ??
                  "The page you're looking for doesn't exist or may have been moved.",
              style:
                  errorDescriptionTextStyle ??
                  context.textTheme.bodySmall
                      ?.copyWith(
                        color: context.customTheme.textPrimary,
                        fontWeight: AppFontWeight.regular,
                        fontFamily: AppConstants.englishFont,
                      )
                      .scaleTextStyleForLocale,
              textAlign: TextAlign.center,
            ),
          ],
          if (showButton) ...[
            AppGaps.gapH8,
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                elevation: 0.5,
                shape: RoundedRectangleBorder(
                  borderRadius: AppBorderRadius.mediumBorderRadius,
                ),
                backgroundColor: context.customTheme.active,
                foregroundColor: context.customTheme.onPrimary,
              ),
              onPressed: onButtonTap,
              icon: iconWidget,
              label:
                  buttonInsideWidget ??
                  ParentTextWidget(
                    buttonText ?? "Refresh",
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.customTheme.onPrimary,
                      fontWeight: AppFontWeight.semiBold,
                    ),
                  ),
            ),
          ],
          if (showAnotherButton) ...[
            if (anotherButton != null) anotherButtonGap ?? AppGaps.gapH8,
            anotherButton ?? SizedBox.shrink(),
          ],
        ],
      ),
    );
  }
}
