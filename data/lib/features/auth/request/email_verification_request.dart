import 'package:data/network/remote_target.dart';

class EmailVerificationRequest extends IRemoteTarget {
  String email;

  EmailVerificationRequest({
    required this.email,
  }) {
    queryParameters = {"email": email};
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => "api/User/email-verification";
}
