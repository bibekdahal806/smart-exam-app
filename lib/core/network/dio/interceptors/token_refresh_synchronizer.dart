import 'dart:async';

class TokenRefreshSynchronizer {
  static Completer<String?>? _refreshCompleter;

  static Future<String?> refreshToken(
    Future<String?> Function() refreshCallback,
  ) async {
    if (_refreshCompleter != null) return _refreshCompleter!.future;

    _refreshCompleter = Completer<String?>();
    try {
      final newToken = await refreshCallback();
      _refreshCompleter!.complete(newToken);
      return newToken;
    } catch (e) {
      _refreshCompleter!.completeError(e);
      return null;
    } finally {
      _refreshCompleter = null;
    }
  }
}
