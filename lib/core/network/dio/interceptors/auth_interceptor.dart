import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:q_bank/core/core.dart';

class AuthInterceptor extends Interceptor {
  final AsyncValueGetter<String?>? accessToken;
  final bool isTokenRequired;

  AuthInterceptor({this.accessToken, required this.isTokenRequired});

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String token = isTokenRequired
        ? accessToken != null
              ? await accessToken!() ?? ''
              : await SecureStorageHelper.instance.getData(
                      key: HiveTableKeys.accessTokenKey,
                    ) ??
                    ''
        : '';
    if (token.isNotEmpty) {
      options.headers.putIfAbsent('Authorization', () => 'Bearer $token');
    }

    super.onRequest(options, handler);
  }
}
