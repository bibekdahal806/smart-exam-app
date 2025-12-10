class ApiRoutes {
  //api
  static const String apiEndPoint = 'api';

  //api-auth
  //api-auth-login
  static const String appleLoginEndPoint = '$apiEndPoint/auth/apple/';
  static const String googleLoginEndPoint = '$apiEndPoint/auth/google/';
  static const String refreshTokenEndPoint = '$apiEndPoint/auth/token/refresh/';
  static const String logoutEndPoint = '$apiEndPoint/auth/logout/';
  //api-auth-user
  static const String userEndPoint = '$apiEndPoint/auth/user/';
}
