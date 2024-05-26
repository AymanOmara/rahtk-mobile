class UserStatusEntity {
  final bool firstRun;
  final bool login;
  final String locale;

  const UserStatusEntity({
    required this.login,
    required this.firstRun,
    required this.locale,
  });
}
