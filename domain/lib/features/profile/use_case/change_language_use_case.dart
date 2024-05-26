import 'package:domain/locale_storage/i_user_local.dart';

class ChangeLanguageUseCase {
  final IUserLocal _userLocal;

  ChangeLanguageUseCase(this._userLocal);

  void call(String locale) {
    _userLocal.setLocale(locale);
  }
}
