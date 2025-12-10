import 'dart:io';

import 'package:flutter/foundation.dart';

abstract class RemoteService {
  Future<dynamic> getResponse({
    String? baseUrl,
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  });

  Future<dynamic> deleteResponse({
    required String endPoint,
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  });

  Future<dynamic> postResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    Map<String, File> files = const {},
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  });

  Future<dynamic> putResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    Map<String, File> files = const {},
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  });

  Future<dynamic> patchResponse({
    required String endPoint,
    Map<String, dynamic>? payloadObj,
    Map<String, dynamic>? queryParameters,
    Map<String, File> files = const {},
    bool isTokenRequired = false,
    AsyncValueGetter<String?>? accessToken,
  });
}
