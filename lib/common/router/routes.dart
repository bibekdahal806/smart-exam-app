enum Routes {
  //onboarding
  splash(name: "splash", path: "/"),
  onboarding(name: "onboarding", path: "/onboarding"),

  //auth
  login(name: "login", path: "/login"),
  signup(name: "signUp", path: "/sign-up"),
  //dashboard
  dashboard(name: "dashboard", path: "/dashboard"),
  profile(name: "profile", path: "/profile"),
  editProfile(name: "editProfile", path: "/edit-profile"),
  setting(name: "setting", path: "/setting"),
  deleteAccount(name: "deleteAccount", path: "/delete-account"),
  about(name: "about", path: "/about")
  //
  ;

  const Routes({required this.path, required this.name});

  final String path;
  final String name;
}
