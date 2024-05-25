import 'package:data/features/order/model/add_payment_model.dart';
import 'package:domain/features/order/entity/add_payment_entity.dart';

extension AddPaymentEntityMapper on BasePaymentEntity {
  AddPaymentModel toModel() {
    return AddPaymentModel(
      cardNumber: cardNumber,
      cardHolder: holderName,
      cvv: cvv,
      expirationDate: expiryDate,
    );
  }
}
