import 'package:domain/locale_storage/i_user_local.dart';

class LogoutUseCase {
  final IUserLocal _iUserLocal;

  const LogoutUseCase(this._iUserLocal);

  void call()  {
     _iUserLocal.logout();
  }
}
