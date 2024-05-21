abstract interface class IUserLocal {
  String get getLocale;

  String get getAccessToken;

  void setAccessToken(String accessToken);

  String get getRefreshToken;

  void setRefreshToken(String refreshToken);

  bool get firstRun;

  void setFirstRun();

  bool get login;
}
