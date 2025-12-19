import 'dart:async';

import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/user/user.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserSessionRepositoryImpl implements UserSessionRepository {
  UserSessionRepositoryImpl();

  // final CustomLogger _log = CustomLogger(title: "UserSessionRepositoryImpl");
  late final ValueListenable _listenable;
  var box = Hive.appUserDataBox;

  final String _userKey = HiveTableKeys.getKey(
    boxName: HiveBoxNameKeys.loggedUserDataBoxName,
    keyName: HiveTableKeys.userDetailKey,
  );
  final String _accessTokenKey = HiveTableKeys.accessTokenKey;
  final String _refreshTokenKey = HiveTableKeys.refreshTokenKey;

  final StreamController<UserEntity?> _sessionChangesController =
      StreamController<UserEntity?>.broadcast();

  //secure storage for app tokens
  final SecureStorageHelper _secureStorage = SecureStorageHelper.instance;

  // Save the user session and emit changes
  @override
  Future<bool> saveLoggedInUser(UserEntity user) async {
    await box.put(_userKey, UserMapper.toRawJsonFromEntity(user));
    _sessionChangesController.add(user);
    return true;
  }

  @override
  Future<UserEntity?> getLoggedInUser() async {
    String? userJson = await box.get(_userKey);
    if (userJson == null) {
      return null;
    }
    return UserMapper.fromRawJsonToEntity(userJson);
  }

  @override
  Future<bool> clearLoggedInUser() async {
    await box.delete(_userKey);
    _sessionChangesController.add(null);
    return true;
  }

  @override
  Future<bool> saveAccessToken(String accessToken) async {
    await _secureStorage.setData(key: _accessTokenKey, value: accessToken);
    return true;
  }

  @override
  Future<String?> getAccessToken() async {
    String? accessToken = await _secureStorage.getData(key: _accessTokenKey);
    if (accessToken == null) {
      return null;
    }
    return accessToken;
  }

  @override
  Future<bool> clearAccessToken() async {
    await _secureStorage.removeData(key: _accessTokenKey);
    return true;
  }

  @override
  Future<bool> saveRefreshToken(String refreshToken) async {
    await _secureStorage.setData(key: _refreshTokenKey, value: refreshToken);
    return true;
  }

  @override
  Future<String?> getRefreshToken() async {
    String? refreshToken = await _secureStorage.getData(key: _refreshTokenKey);
    if (refreshToken == null) {
      return null;
    }
    return refreshToken;
  }

  @override
  Future<bool> clearRefreshToken() async {
    await _secureStorage.removeData(key: _refreshTokenKey);
    return true;
  }

  @override
  Future<bool> updateTokens(String accessToken, String refreshToken) async {
    await saveAccessToken(accessToken);
    await saveRefreshToken(refreshToken);
    return true;
  }

  // Save the session and emit it after saving
  @override
  Future<bool> saveUserSession({
    required UserEntity user,
    required String accessToken,
    required String refreshToken,
  }) async {
    await saveLoggedInUser(user);
    await updateTokens(accessToken, refreshToken);
    return true;
  }

  // Clear session and emit null
  @override
  Future<bool> clearUserSession() async {
    await clearLoggedInUser();
    await clearAccessToken();
    await clearRefreshToken();
    return true;
  }

  @override
  Stream<UserEntity?> watchUserSession() async* {
    // Emit the initial user
    final initialUser = await getLoggedInUser();
    yield initialUser;

    // Listen to changes in Hive box
    _listenable = box.listenable(keys: [_userKey]);
    _listenable.addListener(_emitUserChanges);

    // Yield future updates from stream controller
    yield* _sessionChangesController.stream;
  }

  void _emitUserChanges() async {
    final updatedUser = await getLoggedInUser();
    _sessionChangesController.add(updatedUser);
  }

  void dispose() {
    _listenable.removeListener(_emitUserChanges);
    _sessionChangesController.close();
  }
}
