abstract interface class IUserPreferences {
  String get getLocale;

  void setLocale(String language);

  String get getAccessToken;

  void setAccessToken(String accessToken);

  String get getRefreshToken;

  void setRefreshToken(String refreshToken);

  void setDarkMode(bool darkMode);

  bool get getDarkMode;
}
