import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutInterceptor extends Interceptor {
  bool _isLoggedOut = false;

  void markAsLoggedOut() => _isLoggedOut = true;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_isLoggedOut) {
      return handler.reject(
        DioException(
          requestOptions: options,
          error: "User logged out - request blocked",
          type: DioExceptionType.cancel,
        ),
      );
    }
    super.onRequest(options, handler);
  }
}
