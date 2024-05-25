import 'package:domain/features/order/entity/add_payment_entity.dart';
import 'package:get/get.dart';

class AddPaymentDisplay {
  var holderName = "".obs;
  var cardNumber = "".obs;
  var expiryDate = "".obs;
  var cvv = "".obs;

  String secureCardNumber() {
    if (cardNumber.value.length < 12) {
      return cardNumber.value;
    }
    String firstSix = cardNumber.value.substring(0, 6);
    String lastFour = cardNumber.value.substring(cardNumber.value.length - 4);
    String maskedSection = '*' * (cardNumber.value.length - 10);
    return '$firstSix$maskedSection$lastFour';
  }

  BasePaymentEntity toEntity() {
    return BasePaymentEntity(
      holderName: holderName.value,
      cardNumber: cardNumber.value,
      expiryDate: expiryDate.value,
      cvv: cvv.value,
    );
  }
}
