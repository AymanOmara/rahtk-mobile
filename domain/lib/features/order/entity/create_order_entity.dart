class CreateOrderEntity {
  int? paymentId;
  int? addressId;
  String? paymentMethod;
  final List<CreateOrderItemEntity> items;
  final List<CreateOrderItemEntity> drugs;

  CreateOrderEntity({
    required this.paymentId,
    required this.addressId,
    required this.paymentMethod,
    required this.items,
    required this.drugs,
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
