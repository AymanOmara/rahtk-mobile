import 'package:data/network/decode_able.dart';

class PaymentModel implements DecodeAble<PaymentModel, Map?> {
  int? id;
  String? cvv;
  String? cardHolder;
  String? expirationDate;
  String? cardNumber;

  @override
  PaymentModel fromJson(Map? json) {
    return PaymentModel()
      ..id = json?['id']
      ..expirationDate = json?['expirationDate']
      ..cvv = json?['cvv']
      ..cardHolder = json?['cardHolder']
      ..cardNumber = json?['cardNumber'];
  }
}
