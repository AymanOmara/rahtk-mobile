import 'package:data/features/order/model/create_order_model.dart';
import 'package:domain/features/order/entity/create_order_entity.dart';

extension CreateOrderEntityMapper on CreateOrderEntity {
  CreateOrderModel toModel() {
    return CreateOrderModel(
        paymentId: paymentId,
        addressId: addressId,
        paymentMethod: paymentMethod,
        items: items
            .map(
              (e) => CreateOrderItemModel(
                productId: e.productId,
                quantity: e.quantity,
              ),
            )
            .toList());
  }
}
