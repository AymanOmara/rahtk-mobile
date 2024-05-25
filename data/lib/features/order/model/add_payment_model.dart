import 'package:data/network/encode_able.dart';

class AddPaymentModel implements EncodeAble {
  final String cvv;
  final String cardHolder;
  final String expirationDate;
  final String cardNumber;

  const AddPaymentModel({
    required this.cardNumber,
    required this.cardHolder,
    required this.cvv,
    required this.expirationDate,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "cvv": cvv,
      "cardHolder": cardHolder,
      "expirationDate": expirationDate,
      "cardNumber": cardNumber
    };
  }
}
