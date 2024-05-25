import 'package:domain/features/order/entity/payment_option_entity.dart';

class PaymentOptionDisplay extends PaymentOptionEntity {
  bool selected = false;

  PaymentOptionDisplay({
    required super.id,
    required super.holderName,
    required super.cardNumber,
    required super.expiryDate,
    required super.cvv,
  });
}
extension PaymentOptionEntityMapper on PaymentOptionEntity{
  PaymentOptionDisplay toDisplay() {
    return PaymentOptionDisplay(
      id: id,
      holderName: holderName,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cvv: cvv,
    );
  }
}