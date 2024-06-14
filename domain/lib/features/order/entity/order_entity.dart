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

  OrderEntity({
    required this.payment,
    required this.paymentMethod,
    required this.address,
    required this.id,
    required this.items,
    required this.date,
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
