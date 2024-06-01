import 'package:data/locale/locale_keys.dart';
import 'package:domain/locale_storage/i_user_local.dart';
import 'package:get_storage/get_storage.dart';

class UserLocal implements IUserLocal {
  final GetStorage _storage;

  UserLocal(this._storage);

  @override
  String get getAccessToken => _storage.read(LocaleKeys.token) ?? "";

  @override
  String get getRefreshToken => _storage.read(LocaleKeys.refreshToken) ?? "";

  @override
  void setAccessToken(String accessToken) {
    _storage.write(LocaleKeys.token, accessToken);
  }

  @override
  void setRefreshToken(String refreshToken) {
    _storage.write(LocaleKeys.refreshToken, refreshToken);
  }

  @override
  String get getLocale => _storage.read(LocaleKeys.locale) ?? "en";

  @override
  void setLocale(String locale) {
    _storage.write(LocaleKeys.locale, locale);
  }

  @override
  bool get firstRun => _storage.read(LocaleKeys.firstLunch) ?? true;

  @override
  bool get login => getAccessToken.isNotEmpty;

  @override
  void setFirstRun() {
    _storage.write(LocaleKeys.firstLunch, false);
  }

  @override
  void logout() {
    setRefreshToken("");
    setAccessToken("");
  }

  @override
  String get fcmToken => _storage.read(LocaleKeys.fcmToken) ?? "";

  @override
  void setFcmToken(String fcmToken) {
    _storage.write(LocaleKeys.fcmToken, fcmToken);
  }
}
