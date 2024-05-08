part of 'forget_password_cubit.dart';

@immutable
abstract class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordResult extends ForgetPasswordState {
  final String message;
  final bool success;

  ForgetPasswordResult({
    required this.message,
    required this.success,
  });
}
