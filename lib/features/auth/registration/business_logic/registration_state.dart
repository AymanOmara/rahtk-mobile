part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationLoading extends RegistrationState {}

final class RegistrationPasswordVisibilityChanged extends RegistrationState {}

final class RegistrationResult extends RegistrationState {
  final bool success;
  final String message;

  RegistrationResult({
    required this.success,
    required this.message,
  });
}
