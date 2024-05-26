abstract interface class IUserLocal {
  String get getLocale;
  void setLocale(String locale);

  String get getAccessToken;

  void setAccessToken(String accessToken);


  String get getRefreshToken;

  void setRefreshToken(String refreshToken);

  bool get firstRun;

  void setFirstRun();

  void logout();

  bool get login;

}
