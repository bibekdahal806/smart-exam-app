import 'package:q_bank/modules/user/user.dart';

abstract class UserSessionRepository {
  //for user
  Future<bool> saveLoggedInUser(UserEntity user);
  Future<UserEntity?> getLoggedInUser();
  Future<bool> clearLoggedInUser();

  //for access tokens
  Future<bool> saveAccessToken(String accessToken);
  Future<String?> getAccessToken();
  Future<bool> clearAccessToken();

  //for refresh token
  Future<bool> saveRefreshToken(String refreshToken);
  Future<String?> getRefreshToken();
  Future<bool> clearRefreshToken();

  //for tokens(access and refresh)
  Future<bool> updateTokens(String accessToken, String refreshToken);

  //for user session
  Future<bool> saveUserSession({
    required UserEntity user,
    required String accessToken,
    required String refreshToken,
  });
  Stream<UserEntity?> watchUserSession();
  Future<bool> clearUserSession();
}
