import 'package:data/network/encode_able.dart';

class ForgetPasswordModel implements EncodeAble {
  final String email;
  final String password;
  final String otp;

  ForgetPasswordModel({
    required this.otp,
    required this.email,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "otp": otp
    };
  }
}
