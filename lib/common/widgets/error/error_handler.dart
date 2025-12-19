import 'dart:io';

import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';

class AppErrorHandler {
  static String getErrorMessage(Object error) {
    if (error is SocketException) {
      return Messages.noInternetConnection;
    } else if (error is AppException) {
      return error.message;
    } else {
      return error.toString();
    }
  }
}
