import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';

@Injectable(as: LogoutHandler)
class LogoutHandlerImpl implements LogoutHandler {
  final UserSessionRepository _userSessionRepository =
      getIt<UserSessionRepository>();

  /// instance of dio Config
  final _config = getIt<DioConfigs>();
  final CustomLogger _logger = CustomLogger(title: "Logout Helper Impl");

  LogoutHandlerImpl();

  /// Logs out the user from all required sources
  @override
  Future<void> logout({bool? isStillAuthenticated}) async {
    try {
      if (isStillAuthenticated ?? true) {
        try {
          //first logout user from the server
          _logoutFromServer();
        } catch (error) {
          // _logger.e('logging out in the server: ${error.toString()}');
        }
      }

      GlobalCancelTokenManager.cancelAllRequests();
      getIt<LogoutInterceptor>().markAsLoggedOut();
      await _userSessionRepository.clearUserSession();
    } catch (e) {
      GlobalCancelTokenManager.cancelAllRequests();
      getIt<LogoutInterceptor>().markAsLoggedOut();
      await _userSessionRepository.clearUserSession();
    }
  }

  /// Logs out the user from the server
  Future<void> _logoutFromServer() async {
    try {
      final refreshToken = await _userSessionRepository.getRefreshToken() ?? "";
      final accessToken = await _userSessionRepository.getAccessToken() ?? "";

      if (refreshToken.isEmpty || accessToken.isEmpty) {
        _logger.w("No tokens available, skipping server logout.");
        return;
      }

      try {
        final newDio =
            Dio(
                BaseOptions(
                  baseUrl: _config.baseUrl,
                  connectTimeout: Duration(
                    milliseconds: _config.connectionTimeout,
                  ),
                  receiveTimeout: Duration(
                    milliseconds: _config.receiveTimeout,
                  ),
                ),
              )
              ..interceptors.add(
                LogInterceptor(
                  request: true,
                  responseBody: true,
                  requestBody: true,
                ),
              );
        await newDio.post(
          '${_config.baseUrl}/${ApiRoutes.logoutEndPoint}',
          options: Options(
            headers: {
              'Authorization': 'Bearer $accessToken',
              'Content-Type': 'application/json',
            },
          ),
          data: {'refresh': refreshToken},
        );
        return;
      } catch (_) {}
    } catch (error) {
      _logger.e('Error logging out from the server: ${error.toString()}');
    }
  }
}
