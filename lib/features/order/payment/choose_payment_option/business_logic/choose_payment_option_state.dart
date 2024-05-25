part of 'choose_payment_option_cubit.dart';

@immutable
abstract class ChoosePaymentOptionState {}

final class ChoosePaymentOptionInitial extends ChoosePaymentOptionState {}

final class ChoosePaymentOptionLoading extends ChoosePaymentOptionState {}

final class ChoosePaymentOptionResult extends ChoosePaymentOptionState {}

final class ChoosePaymentOptionAddPayment extends ChoosePaymentOptionState {}

final class ChoosePaymentOptionUpdatePageIndex extends ChoosePaymentOptionState {}

final class ChoosePaymentOptionUpdateSelectedCard extends ChoosePaymentOptionState {}

final class ChoosePaymentOptionUpdatePaymentMethod extends ChoosePaymentOptionState {}

final class ChoosePaymentOptionUpdateAddress extends ChoosePaymentOptionState {}
