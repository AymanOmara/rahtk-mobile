import 'package:data/features/order/mappers/address_entity_mapper.dart';
import 'package:data/features/order/mappers/payment_option_entity_mapper.dart';
import 'package:data/features/order/model/order_model.dart';
import 'package:data/features/products/mapper/product_mapper.dart';
import 'package:domain/features/order/entity/order_entity.dart';

extension OrderEntityMapper on OrderModel {
  OrderEntity toEntity() {
    return OrderEntity(
      payment: payment?.toEntity(),
      paymentMethod: paymentMethod ?? "",
      address: address?.toEntity(),
      id: id ?? 0,
      items: items
              ?.map((e) => OrderItemEntity(
                  quantity: e.quantity ?? 0, product: e.product?.toEntity()))
              .toList() ??
          [],
      date: date ?? "",
    );
  }
}
