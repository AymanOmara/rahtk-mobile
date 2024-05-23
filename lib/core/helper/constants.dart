class AppRoutes {
  AppRoutes._();
  /// ********* Auth **********
  static const login = "/login";
  static const forgetPassword = "/forgetPassword";
  static const emailVerification = "/emailVerification";
  static const verifyOtp = "/verifyOtp";
  static const registration = "/registration";

  /// ********* Home **********
  static const home = "/home";

  /// ********* Misc **********
  static const onBoarding = "/onBoarding";

  /// ********* Product **********
  static const categoryProducts = "/categoryProducts";
  static const productDetails = "/productDetails";
  static const favorites = "/favorites";
  static const cart = "/cart";
}
