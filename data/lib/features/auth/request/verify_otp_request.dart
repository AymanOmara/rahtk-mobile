import 'package:data/network/remote_target.dart';

class VerifyOtpRequest extends IRemoteTarget {
  final String otp;
  final String email;

  VerifyOtpRequest({
    required this.otp,
    required this.email,
  }) {
    queryParameters = {"otp": otp, "email": email};
  }

  @override
  String? get path => "api/User/verify-otp";
}
