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
  static const notifications = "/notifications";
  static const termsConditions = "/termsConditions";

  /// ********* Product **********
  static const categoryProducts = "/categoryProducts";
  static const productDetails = "/productDetails";
  static const favorites = "/favorites";
  static const cart = "/cart";
  static const addAddress = "/addAddress";

  /// ********* Order **********
  static const paymentOptions = "/paymentOptions";
  static const addPayment = "/addPayment";
  static const orderSuccess = "/orderSuccess";

  /// ********* Drug **********
  static const allDrugsPage = "/allDrugsPage";
  static const drugDetails = "/drugDetails";
}
