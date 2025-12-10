// global_token_manager.dart
import 'package:dio/dio.dart';

class GlobalCancelTokenManager {
  static CancelToken? _cancelToken;

  static CancelToken get token {
    _cancelToken ??= CancelToken();
    return _cancelToken!;
  }

  static void cancelAllRequests() {
    _cancelToken?.cancel("User logged out");
    _cancelToken = CancelToken();
  }
}
