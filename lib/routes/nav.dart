class Navigation {
  static String splashView = "/";
  static String homeView = "/home";
  static String loginView = "/login";
  static String dashboardView = "/dashboard";
  static String collectionView = "/collection";
  static String groomingView = "/grooming";
  static String profileView = "/profile";
}

String getNavigatorName(String path) {
  return path.replaceFirst("/", "");
}
