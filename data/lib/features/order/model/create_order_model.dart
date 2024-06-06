import 'package:data/network/encode_able.dart';

class CreateOrderModel implements EncodeAble {
  int? paymentId;
  int? addressId;
  String? paymentMethod;
  List<CreateOrderItemModel>? items;
  List<CreateOrderItemModel>? drugs;

  CreateOrderModel({
    this.paymentMethod,
    this.items,
    this.addressId,
    this.paymentId,
    this.drugs,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "paymentId": paymentId,
      "addressId": addressId,
      "paymentMethod": paymentMethod,
      "orderItemModel": items
          ?.map((e) => {
                "productId": e.productId,
                "productCount": e.quantity,
              })
          .toList(),
      "drugItemModel": drugs
          ?.map((e) => {
                "productId": e.productId,
                "productCount": e.quantity,
              })
          .toList()
    };
  }
}

class CreateOrderItemModel {
  int? productId;
  int? quantity;

  CreateOrderItemModel({
    required this.productId,
    required this.quantity,
  });
}
