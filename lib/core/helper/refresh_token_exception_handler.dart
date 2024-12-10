import 'package:domain/common/refresh_token_exception_handler.dart';
import 'package:get/get.dart';

class RefreshTokenExceptionHandler implements IRefreshTokenExceptionHandler {

  @override
  void onRefreshTokenExpired() {
    navigator?.context;
  }
}
