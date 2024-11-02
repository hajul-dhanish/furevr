class Navigation {
  static String splashView = "/";
  static String testView = "/test";
  static String homeView = "/home";
  static String loginView = "/login";
  static String dashboardView = "/dashboard";
  static String collectionView = "/collection";
  static String groomingView = "/grooming";
  static String profileView = "/profile";
  static String mobileAuthView = "/mobile_auth";
}

String getNavigatorName(String path) {
  return path.replaceFirst("/", "");
}
