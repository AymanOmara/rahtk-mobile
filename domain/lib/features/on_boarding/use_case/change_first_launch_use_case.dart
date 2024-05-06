import 'package:domain/locale_storage/i_user_local.dart';

class ChangeFirstLaunchUseCase {
  final IUserLocal _locale;

  ChangeFirstLaunchUseCase(this._locale);

  void call() {
    _locale.setFirstRun();
  }
}
