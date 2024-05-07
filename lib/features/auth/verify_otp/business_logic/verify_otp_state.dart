part of 'verify_otp_cubit.dart';

@immutable
abstract class VerifyOtpState {}

final class VerifyOtpInitial extends VerifyOtpState {}

final class VerifyOtpLoading extends VerifyOtpState {}

final class VerifyOtpResult extends VerifyOtpState {
  final bool success;
  final String message;

  VerifyOtpResult({
    required this.success,
    required this.message,
  });
}
