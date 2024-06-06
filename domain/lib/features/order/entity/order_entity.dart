import 'package:domain/features/drugs/entity/drug_entity.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/entity/payment_option_entity.dart';
import 'package:domain/features/product/entity/product_entity.dart';

class OrderEntity {
  final int id;
  final String date;
  final String paymentMethod;
  final AddressEntity? address;
  final PaymentOptionEntity? payment;
  final List<OrderItemEntity> items;
  final List<OrderDrugItemEntity> drugs;

  OrderEntity({
    required this.payment,
    required this.paymentMethod,
    required this.address,
    required this.id,
    required this.items,
    required this.date,
    required this.drugs,
  });

  double totalPrice() {
    double total = 0;

    // Calculate the total price of the products
    for (var item in items) {
      if (item.product != null) {
        double discountedPrice =
            item.product!.price * (1 - item.product!.discountPercentage / 100);
        total += discountedPrice * item.quantity;
      }
    }

    // Calculate the total price of the drugs
    for (var drugItem in drugs) {
      if (drugItem.drug != null) {
        double discountedPrice =
            drugItem.drug!.price * (1 - drugItem.drug!.discountPercentage / 100);
        total += discountedPrice * drugItem.quantity;
      }
    }

    return total;
  }
}

class OrderItemEntity {
  final ProductEntity? product;
  final int quantity;

  OrderItemEntity({
    required this.quantity,
    required this.product,
  });
}

class OrderDrugItemEntity {
  final DrugEntity? drug;
  final int quantity;

  OrderDrugItemEntity({
    required this.drug,
    required this.quantity,
  });
}
