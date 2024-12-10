import 'package:domain/common/network/exceptions/network_exception.dart';

class RefreshTokenException implements NetworkException {
  @override
  String get message => "refresh_token_exception_login_required";
}
