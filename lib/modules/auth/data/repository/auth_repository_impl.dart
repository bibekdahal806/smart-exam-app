import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:q_bank/common/common.dart';
import 'package:q_bank/core/core.dart';
import 'package:q_bank/modules/auth/auth.dart';
import 'package:q_bank/modules/user/user.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl();

  final RemoteService _remoteService = getIt<RemoteService>();
  final UserSessionRepository _userSessionRepository =
      getIt<UserSessionRepository>();
  final LogoutHandler _logoutHandler = getIt<LogoutHandler>();
  // final CustomLogger _log = CustomLogger(title: "Auth Rep Impl");

  @override
  Future<void> registerUser({
    required String email,
    required String fullName,
    required String phoneNumber,
    required String address,
    required String password,
  }) async {
    try {
      var response = await _remoteService.postResponse(
        endPoint: ApiRoutes.registerEndPoint,
        isTokenRequired: false,
        payloadObj: {
          "name": fullName,
          "email": email,
          "password": password,
          "password_confirmation": password,
          "phone": phoneNumber,
          "address": address,
        },
      );
      var isSaved = await _saveUserTokens(response);
      if (!isSaved) {
        throw AuthenticationException(Messages.registerUserFailed);
      }
      await _fetchAndSaveUser();
    } catch (error) {
      await _userSessionRepository.clearUserSession();
      rethrow;
    }
  }

  @override
  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var response = await _remoteService.postResponse(
        endPoint: ApiRoutes.loginEndPoint,
        isTokenRequired: false,
        payloadObj: {"email": email, "password": password},
      );
      var isSaved = await _saveUserTokens(response);
      if (!isSaved) {
        throw AuthenticationException(Messages.loginFailed);
      }
      await _fetchAndSaveUser();
    } catch (error) {
      await _userSessionRepository.clearUserSession();
      rethrow;
    }
  }

  @override
  Stream<UserEntity?> getCurrentAuthUserState() async* {
    try {
      // Watch for user session changes
      yield* _userSessionRepository.watchUserSession().asyncExpand((
        user,
      ) async* {
        if (user == null || user.id == null) {
          yield null; // Emit null for invalid sessions
          return;
        } else {
          yield user;
        }
      });
    } catch (e) {
      yield null;
    }
  }

  /// fetch & save user
  Future<UserEntity> _fetchAndSaveUser() async {
    final response = await _remoteService.getResponse(
      endPoint: ApiRoutes.userEndPoint,
      isTokenRequired: true,
    );
    final userJsonData = response != null ? response['data']["user"] : null;
    if (userJsonData == null || (userJsonData is Map && userJsonData.isEmpty)) {
      await _userSessionRepository.clearUserSession();
      throw AuthenticationException(Messages.getUserDataFailed);
    }

    final user = UserMapper.fromJsonToEntity(userJsonData);
    await _userSessionRepository.saveLoggedInUser(user);
    return user;
  }

  /// fetch & save user
  Future<bool> _saveUserTokens(dynamic response) async {
    if (response != null) {
      final accessToken = response['data']['tokens']['access'];
      final refreshToken = response['data']['tokens']['refresh'];
      if (accessToken == null ||
          accessToken == "" ||
          refreshToken == null ||
          refreshToken == "") {
        throw AuthenticationException(Messages.getUserTokenFailed);
      }
      return await _userSessionRepository.updateTokens(
        accessToken,
        refreshToken,
      );
    } else {
      throw AuthenticationException(Messages.getUserTokenFailed);
    }
  }

  @override
  Future<UserEntity?> getLoggedInUser() async {
    return _userSessionRepository.getLoggedInUser();
  }

  @override
  Future<void> logout({bool? isStillAuthenticated}) async {
    return _logoutHandler.logout(isStillAuthenticated: isStillAuthenticated);
  }
}
