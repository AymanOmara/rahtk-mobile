import 'package:rahtk_mobile/features/order/payment/choose_payment_option/display/choose_payment_option_params.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/display/payment_option_display.dart';

class OrderSuccessParamsDisplay {
  final PaymentOptionDisplay? paymentOptionDisplay;
  final ChoosePaymentOptionParams paymentOptionParams;
  final int? orderId;
  OrderSuccessParamsDisplay({
    required this.paymentOptionDisplay,
    required this.paymentOptionParams,
    required this.orderId,
  });
}
