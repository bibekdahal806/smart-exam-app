import 'package:flutter/cupertino.dart';

extension NumExtension on num {
  SizedBox get horizontalSpace => SizedBox(width: double.parse(toString()));
  SizedBox get verticalSpace => SizedBox(height: double.parse(toString()));

  String padLeft(int width, [String padding = ' ']) =>
      toString().padLeft(width, padding);

  /// Return a double with the given number of [fractionDigits].
  double toPrecision(int fractionDigits) {
    return double.parse(toStringAsFixed(fractionDigits));
  }

  /// Return a double with 2 [fractionDigits].
  double toPrecision2() => toPrecision(2);

  /// Returns the ordinal suffix of the number.
  /// Example: 1st, 2nd, 3rd, 4th, 5th, etc.
  String get _ordinalSuffix {
    if (this >= 11 && this <= 13) {
      return 'th';
    }
    return switch (this % 10) {
      1 => 'st',
      2 => 'nd',
      3 => 'rd',
      _ => 'th',
    };
  }

  /// Returns the number with the ordinal suffix.
  /// Example: 1st, 2nd, 3rd, 4th, 5th, etc.
  String get withOrdinalSuffix => '$this$_ordinalSuffix';

  /// Returns a string with up to [maxFractionDigits] decimals (no unnecessary trailing zeros).
  /// Example:
  /// 1 → 1.0
  /// 1.2 → 1.2
  /// 1.44444 → 1.444
  String toMaxPrecision(int maxFractionDigits) {
    // Convert to string with full precision up to maxFractionDigits
    String value = toStringAsFixed(maxFractionDigits);

    // Remove unnecessary trailing zeros
    value = value.replaceFirst(RegExp(r'0+$'), '');

    // Remove trailing decimal point (e.g., "1." → "1")
    value = value.replaceFirst(RegExp(r'\.$'), '');

    // If integer, ensure at least one decimal digit (1 → 1.0)
    if (!value.contains('.')) {
      value = '$value.0';
    }

    return value;
  }
}
