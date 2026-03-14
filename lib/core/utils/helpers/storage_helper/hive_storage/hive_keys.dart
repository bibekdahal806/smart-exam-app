class HiveBoxNameKeys {
  //hive box name
  static const String appSettingDataBoxName = "app_setting_data_box";
  static const String loggedUserDataBoxName = "logged_user_data_box";
  static const String pendingExamsDataBoxName = "pending_exams_data_box";
  static const String bookmarkedExamsDataBoxName = "bookmarked_exams_data_box";
}

class HiveTableKeys {
  static String getKey({required String boxName, required String keyName}) {
    return '$boxName-$keyName';
  }

  //app setting keys
  static const String showOnBoardingKey = "show_on_boarding";
  static const String showSelectLanugageKey = "show_select_language";
  static const String selectedLanugageKey = "selected_language";

  //logged user data keys
  static const String userDetailKey = "user_details";
  static const String accessTokenKey = "access_token";
  static const String refreshTokenKey = "refresh_token";

  // exam
  static const String pendingExamsKey = "pending_exams";
  static const String pendingExamsIndexKey = "pending_exams_index";

  //bookmarked exams
  static const String bookmarkedExamsKey = "bookmarked_exams";
  static const String bookmarkedExamsIndexKey = "bookmarked_exams_index";
}
