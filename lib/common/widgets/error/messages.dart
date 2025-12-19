class Messages {
  //
  static const String somethingWentWrong = 'Something went wrong!';
  static const String noInternetConnection = 'No internet connection!';
  static const String noDataFound = 'No data found!';

  //auth
  static const String loginFailed = 'Login failed!';
  static const String loginSuccess = 'Login Successful!';

  //auth-email
  static const String registerEmailFailed = 'Failed to register email!';
  static const String registerEmailSuccess = 'Email successfully sent!';
  // static const String registerEmailResendSuccess = 'Email successfully sent!';

  //user
  static const String getUserDataFailed = 'Failed to get user data';
  static const String getUserTokenFailed = 'Failed to get user token data';
  static const String editUserDataFailed = 'Failed to edit user data';
  static const String registerUserFailed = 'Failed to register user';

  //banner
  static const String fetchBannersFailed = 'Failed to fetch banners';

  //error
  static String noResultFound = "OOPS! NO RESULT FOUND.";
  static String noResultFoundDesc(String name) =>
      "No result found for $name. Please refresh.";
}
