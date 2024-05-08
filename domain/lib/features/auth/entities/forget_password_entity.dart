class ForgetPasswordEntity {
  final String email;
  final String otp;
  String password = "";
  String confirmPassword = "";

  ForgetPasswordEntity({
    required this.email,
    required this.otp,
  });
}
