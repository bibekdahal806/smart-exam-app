// Utility to parse error responses from APIs and convert them to user-friendly messages.
import 'package:flutter/foundation.dart';
import 'package:q_bank/core/utils/extensions/app/string_extensions.dart';

String parseErrorMapToString<T>(T error) {
  List<String> errText = [];

  try {
    debugPrint(
      '+++++++++++++++++\nerror parser => \n\n$error\n++++++++++++++++++',
    );

    if (error is Map<String, dynamic>) {
      // Helper to recursively extract all nested errors
      void extractErrors(dynamic data, [String parentKey = '']) {
        if (data is Map<String, dynamic>) {
          data.forEach((key, value) {
            final currentKey = key.replaceAll('_', ' ').capitalize();
            extractErrors(value, currentKey);
          });
        } else if (data is List) {
          for (var element in data) {
            extractErrors(element, parentKey);
          }
        } else if (data is String) {
          // Convert "This field may not be null." into a friendly message
          if (data.contains('null') || data.contains('blank')) {
            errText.add('${parentKey.capitalize()} is required');
          } else if (data.contains('unique')) {
            errText.add('${parentKey.capitalize()} already exists');
          } else if (data.contains('field is required')) {
            errText.add('${parentKey.capitalize()} is required');
          } else {
            errText.add(data);
          }
        }
      }

      // First try to extract nested "errors" key
      if (error.containsKey('errors')) {
        extractErrors(error['errors']);
      }

      // Fallback to message if no parsed errors
      if (errText.isEmpty && error.containsKey('message')) {
        errText.add(error['message'].toString());
      }
    } else {
      errText = ['Unknown error occurred'];
    }
  } catch (e) {
    errText = kDebugMode
        ? ['Error decoding error message: $e']
        : ['Unknown error occurred'];
  }
  return errText.join(' & ');
}
