import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/core/core.dart';

@injectable
class DioClient {
  final Dio _dio;

  DioClient(DioConfigs config)
    : _dio = Dio()
        ..options.baseUrl = config.baseUrl
        ..options.connectTimeout = Duration(
          milliseconds: config.connectionTimeout,
        )
        ..options.receiveTimeout = Duration(milliseconds: config.receiveTimeout)
        ..interceptors.add(
          LogInterceptor(request: true, responseBody: true, requestBody: true),
        );

  Dio get dio => _dio;

  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    // Keep only the LogInterceptor
    // _dio.interceptors.removeWhere(
    //   (interceptor) => interceptor is! LogInterceptor,
    // );

    // Add the required interceptors
    _dio.interceptors.add(getIt<LogoutInterceptor>());
    _dio.interceptors.addAll(interceptors);

    return _dio;
  }
}
