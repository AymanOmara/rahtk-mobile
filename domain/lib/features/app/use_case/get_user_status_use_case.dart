import 'package:domain/features/app/entities/user_status.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class GetUserStatusUseCase {
  final IUserLocal _locale;

  GetUserStatusUseCase(this._locale);

  UserStatusEntity call() {
    return UserStatusEntity(
      login: _locale.login,
      firstRun: _locale.firstRun,
      locale: _locale.getLocale,
    );
  }
}
