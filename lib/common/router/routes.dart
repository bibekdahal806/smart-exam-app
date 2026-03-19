enum Routes {
  //onboarding
  splash(name: "splash", path: "/"),
  onboarding(name: "onboarding", path: "/onboarding"),

  //auth
  login(name: "login", path: "/login"),
  signup(name: "signUp", path: "/sign-up"),
  forgetPassword(name: "forget-password", path: "/forget-password"),

  //dashboard
  dashboard(name: "dashboard", path: "/dashboard"),
  profile(name: "profile", path: "/profile"),
  editProfile(name: "editProfile", path: "/edit-profile"),
  setting(name: "setting", path: "/setting"),
  deleteAccount(name: "deleteAccount", path: "/delete-account"),
  about(name: "about", path: "/about"),

  //exam
  exam(name: "exam", path: "/exam"),
  examDetail(name: "exam-detail", path: "/exam-detail"),
  pendingExams(name: "pending-exams", path: "/pending-exams"),
  examReports(name: "exam-reports", path: "/exam-reports"),
  examReportDetail(name: "exam-report-detail", path: "/exam-report-detail")
  //
  //
  //
  ;

  const Routes({required this.path, required this.name});

  final String path;
  final String name;
}
