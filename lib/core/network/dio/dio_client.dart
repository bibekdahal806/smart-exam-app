import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/core/core.dart';

final _dioClient = getIt<Dio>();
final _config = getIt<DioConfigs>();

@injectable
class DioClient {
  final Dio _dio = _dioClient
    ..options.baseUrl = _config.baseUrl
    ..options.connectTimeout = Duration(milliseconds: _config.connectionTimeout)
    ..options.receiveTimeout = Duration(milliseconds: _config.receiveTimeout);

  Dio get dio => _dio;

  Dio addInterceptors(Iterable<Interceptor> interceptors) {
    return _dio
      ..interceptors.add(
        LogInterceptor(request: true, responseBody: true, requestBody: true),
      )
      ..interceptors.add(getIt<LogoutInterceptor>())
      ..interceptors.addAll(interceptors);
  }
}
