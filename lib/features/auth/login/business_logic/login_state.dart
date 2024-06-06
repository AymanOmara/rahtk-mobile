part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginTogglePasswordVisibility extends LoginState {}

final class LoginResult extends LoginState {
  final bool success;
  final String message;

  LoginResult({
    required this.success,
    required this.message,
  });
}
