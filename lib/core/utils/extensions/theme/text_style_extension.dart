import 'package:flutter/material.dart';
import 'package:q_bank/core/utils/constants/app_constants.dart';

extension TextStyleExtension on TextStyle {
  TextStyle get scaleTextStyleForLocale {
    // if (locale.toLowerCase() == 'ne' && fontFamily?.toLowerCase() == 'mukta') {
    if (fontFamily?.toLowerCase() == AppConstants.devnagariFont.toLowerCase()) {
      const scale = 1;
      return copyWith(
        fontSize: fontSize != null ? fontSize! * scale : null,
        // height: height != null ? height! * scale : null,
      );
    }
    return this;
  }
}
