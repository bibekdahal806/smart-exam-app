class AppConstants {
  static const String appName = "QBank";
  static Duration splashDuration = Duration(seconds: 3);
  static int resendOtpTimer = 120;
  static String appBundleID = "app.qbank";
  static String fallbackTimezone = "Asia/Kathmandu";
  static String appIosAppID = "";
  static String defaultNullValue = "--:--";
  static String devnagariFont = "Poppins";
  static String englishFont = "Poppins";

  // If an app only needs an idToken, or only requests permissions to any/all of the three scopes mentioned above (Op/enID Connect scopes), it won't need to implement any additional scope handling.
  static const List<String> googleScopes = <String>[
    'email',
    'profile',
    'openid',
  ];
}
