import 'package:flutter/material.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

enum IconPosition { leading, trailing }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.onTap,
    this.hasShadow = false,
    this.bgColor,
    this.textColor,
    this.padding,
    this.icon,
    this.borderRadius,
    this.constraints,
    this.boxShadow,
    this.labelStyle,
    this.border,
    this.iconPosition = IconPosition.leading,
    this.gap,
  }) : isOutlined = false,
       isBorderless = false;

  final String label;
  final VoidCallback? onTap;
  final bool isOutlined;
  final bool isBorderless;
  final bool hasShadow;
  final Color? bgColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final Widget? icon;
  final BorderRadius? borderRadius;
  final BoxConstraints? constraints;
  final List<BoxShadow>? boxShadow;
  final TextStyle? labelStyle;
  final BoxBorder? border;
  final IconPosition? iconPosition;
  final SizedBox? gap;

  const CustomButton.outlined({
    super.key,
    required this.onTap,
    this.borderRadius,
    this.label = '',
    this.bgColor,
    this.padding,
    this.textColor,
    this.icon,
    this.constraints,
    this.boxShadow,
    this.labelStyle,
    this.border,
    this.iconPosition,
    this.gap,
  }) : isOutlined = true,
       hasShadow = false,
       isBorderless = false;

  const CustomButton.icon({
    super.key,
    required this.onTap,
    this.borderRadius,
    this.label = '',
    this.padding,
    required this.icon,

    this.textColor,
    this.bgColor,
    this.constraints,
    this.boxShadow,
    this.labelStyle,
    this.border,
    this.iconPosition = IconPosition.leading,
    this.gap,
  }) : hasShadow = true,
       isBorderless = false,
       isOutlined = false;

  const CustomButton.borderless({
    super.key,
    required this.onTap,
    this.borderRadius,
    this.label = 'Submit',
    this.textColor,
    this.padding,
    this.bgColor,
    this.constraints,
    this.labelStyle,
    this.iconPosition,
    this.gap,
  }) : hasShadow = false,
       isBorderless = true,
       isOutlined = false,
       icon = null,
       boxShadow = const [],
       border = null;

  const CustomButton.text({
    super.key,
    required this.label,
    required this.onTap,
    this.padding,
    this.textColor,
    this.constraints,
    this.labelStyle,
    this.iconPosition,
    this.gap,
  }) : borderRadius = null,
       bgColor = Colors.transparent,
       icon = null,
       isOutlined = true,
       hasShadow = false,
       isBorderless = false,
       boxShadow = const [],
       border = null;

  bool get isBorderlessSelected => isBorderless && !hasShadow && !isOutlined;

  bool get isIconSelected => hasShadow && !isBorderless && !isOutlined;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            padding ??
            EdgeInsets.symmetric(
              horizontal: AppSpacing.lg.w,
              vertical: AppSpacing.md.h,
            ),
        constraints: constraints,
        decoration: BoxDecoration(
          color: bgColor ?? context.colorScheme.primary,
          border: border,
          borderRadius: borderRadius ?? AppBorderRadius.mediumBorderRadius,
          boxShadow: boxShadow,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null && iconPosition == IconPosition.leading) ...[
              icon!,
              gap ?? AppGaps.gapW8,
            ],
            Flexible(
              child: ParentTextWidget(
                label,
                style:
                    labelStyle ??
                    context.textTheme.labelLarge?.copyWith(
                      fontWeight: AppFontWeight.medium,
                      color: textColor,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (icon != null && iconPosition == IconPosition.trailing) ...[
              gap ?? AppGaps.gapW8,
              icon!,
            ],
          ],
        ),
      ),
    );
  }
}
