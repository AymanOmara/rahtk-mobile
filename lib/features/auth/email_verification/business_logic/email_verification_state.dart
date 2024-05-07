part of 'email_verification_cubit.dart';

@immutable
abstract class EmailVerificationState {}

final class EmailVerificationInitial extends EmailVerificationState {}

final class EmailVerificationLoading extends EmailVerificationState {}

final class EmailVerificationResult extends EmailVerificationState {
  final bool success;
  final String message;

  EmailVerificationResult({
    required this.message,
    required this.success,
  });
}
