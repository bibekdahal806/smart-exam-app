class Messages {
  //
  static const String somethingWentWrong = 'Something went wrong!';
  static const String noInternetConnection = 'No internet connection!';
  static const String noDataFound = 'No data found!';

  //auth
  static const String loginFailed = 'Login failed!';
  static const String loginSuccess = 'Login Successful.';
  static const String registerUserFailed = 'Failed to register user';
  static const String registerUserSuccess = 'User Successfully registered';

  //user
  static const String getUserDataFailed = 'Failed to get user data';
  static const String getUserTokenFailed = 'Failed to get user token data';
  static const String editUserDataFailed = 'Failed to edit user data';

  //error
  static String noResultFound = "OOPS! NO RESULT FOUND.";
  static String noResultFoundDesc(String name) =>
      "No result found for $name. Please refresh.";
}
