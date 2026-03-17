import 'package:flutter/material.dart';
import 'package:q_bank/core/core.dart';

class ParentTextWidget extends StatelessWidget {
  const ParentTextWidget(
    this.text, {
    super.key,
    this.showTooltip = false,
    this.style,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaler,
    this.selectionColor,
    this.maxLines,
    this.semanticsLabel,
    this.strutStyle,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.semanticsIdentifier,
    this.shouldScale = true,
  });

  final String text;
  final bool showTooltip;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final TextScaler? textScaler;
  final Color? selectionColor;
  final int? maxLines;
  final String? semanticsLabel;
  final StrutStyle? strutStyle;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final String? semanticsIdentifier;
  final bool shouldScale;

  @override
  Widget build(BuildContext context) {
    var textWidget = Text(
      text,
      style: shouldScale
          ? style?.scaleTextStyleForLocale
          : style?.scaleTextStyleForLocale,
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      semanticsIdentifier: semanticsIdentifier,
      textScaler: textScaler,
      selectionColor: selectionColor,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      strutStyle: strutStyle,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
    return showTooltip ? Tooltip(message: text, child: textWidget) : textWidget;
  }
}
