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

  //exam
  static const String getExamDataFailed = 'Failed to get exam data';

  //error
  static String noResultFound = "OOPS! NO RESULT FOUND.";
  static String noResultFoundDesc(String name) =>
      "No result found for $name. Please refresh.";

  //password
  static const String changePasswordFailed = 'Failed to change password!';
  static const String changePasswordSuccess = 'Password successfully changed!';
  static const String forgetPasswordFailed = 'Failed to forget password!';
  static const String forgotPasswordSuccess =
      "If the provided email is associated with an account, we’ve sent a password reset link. Please check your email inbox.";
  static const String samePassword =
      'New password cannot be same as old password';
}
