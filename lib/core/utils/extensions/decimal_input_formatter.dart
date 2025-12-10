// Custom TextInputFormatter to limit the number of digits after the decimal
import 'package:flutter/services.dart';
import 'package:q_bank/core/core.dart';

class DecimalInputFormatter extends TextInputFormatter {
  final int maxDecimalDigits;

  DecimalInputFormatter({required this.maxDecimalDigits})
    : assert(maxDecimalDigits > 0, 'maxDecimalDigits must be greater than 0');

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Allow empty input
    if (newValue.text.isEmpty) {
      return newValue;
    }

    // // Regex to check for valid number format
    // final RegExp regex =
    //     RegExp(r'^-?\d*\.?\d{0,' + maxDecimalDigits.toString() + r'}$');

    // // Regex to check for more than allowed decimal digits
    // final RegExp decimalDigitsExceed =
    //     RegExp(r'^-?\d*\.?\d{' + (maxDecimalDigits + 1).toString() + r',}$');
    final RegExp regex = RegExp(
      r'^\d*\.?\d{0,' + maxDecimalDigits.toString() + r'}$',
    );

    // Regex to check for more than allowed decimal digits
    final RegExp decimalDigitsExceed = RegExp(
      r'^\d*\.?\d{' + (maxDecimalDigits + 1).toString() + r',}$',
    );
    if (regex.hasMatch(newValue.text)) {
      return newValue;
    } else if (decimalDigitsExceed.hasMatch(newValue.text)) {
      CustomSnackbar.cancelToastMessage();
      CustomSnackbar.showToastMessage(
        type: ToastType.info,
        message:
            "Only $maxDecimalDigits-digits number is allowed after decimal.",
      );
    } else {
      CustomSnackbar.cancelToastMessage();
      CustomSnackbar.showToastMessage(
        type: ToastType.info,
        message: "Invalid input.",
      );
    }
    // If invalid, keep the old value
    return oldValue;
  }
}
