import 'package:data/network/remote_target.dart';

class RefreshTokenRequest extends IRemoteTarget {
  final String refreshToken;
  final String token;

  RefreshTokenRequest({
    required this.token,
    required this.refreshToken,
  }) {
    body = {"token": token, "refreshToken": refreshToken};
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => "api/Auth/token/refresh";
}
