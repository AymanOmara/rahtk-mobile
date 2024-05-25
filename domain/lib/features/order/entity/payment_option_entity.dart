import 'add_payment_entity.dart';

class PaymentOptionEntity extends BasePaymentEntity {
  final int id;

  PaymentOptionEntity({
    required this.id,
    required super.holderName,
    required super.cardNumber,
    required super.expiryDate,
    required super.cvv,
  });
}
