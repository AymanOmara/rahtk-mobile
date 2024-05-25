import 'package:data/features/order/model/Payment_model.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';

extension PaymentOptionEntityMapper on PaymentModel {
  PaymentOptionEntity toEntity() {
    return PaymentOptionEntity(
      id: id ?? 0,
      holderName: cardHolder ?? "",
      cardNumber: cardNumber ?? "",
      expiryDate: expirationDate ?? "",
      cvv: cvv ?? "",
    );
  }
}