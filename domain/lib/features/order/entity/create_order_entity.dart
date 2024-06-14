class CreateOrderEntity {
  int? paymentId;
  int? addressId;
  String? paymentMethod;
  final List<CreateOrderItemEntity> items;

  CreateOrderEntity({
    required this.paymentId,
    required this.addressId,
    required this.paymentMethod,
    required this.items,
  });
}

class CreateOrderItemEntity {
  final int? productId;
  final int? quantity;

  const CreateOrderItemEntity({
    required this.productId,
    required this.quantity,
  });
}
