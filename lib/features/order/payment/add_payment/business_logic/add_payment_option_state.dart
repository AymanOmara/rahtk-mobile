part of 'add_payment_option_cubit.dart';

@immutable
abstract class AddPaymentOptionState {}

final class AddPaymentOptionInitial extends AddPaymentOptionState {}

final class AddPaymentOptionLoading extends AddPaymentOptionState {}

final class AddPaymentOptionResult extends AddPaymentOptionState {
  final String message;
  final bool success;
  AddPaymentOptionResult({
    required this.message,
    required this.success,
  });
}
