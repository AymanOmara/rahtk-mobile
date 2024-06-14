import 'package:data/features/order/model/Payment_model.dart';
import 'package:data/features/order/model/address_model.dart';
import 'package:data/network/decode_able.dart';

import 'order_item.dart';

class OrderModel implements DecodeAble<OrderModel, Map?> {
  List<OrderItem>? items;
  AddressModel? address;
  PaymentModel? payment;
  int? id;
  String? date;
  String? paymentMethod;

  @override
  OrderModel fromJson(Map? json) {
    return OrderModel()
      ..payment = PaymentModel().fromJson(json?['payment'])
      ..address = AddressModel().fromJson(json?['address'])
      ..id = json?['id']
      ..date = json?['createdDate']
      ..items = OrderItem().fromJson(json?['items'])
      ..paymentMethod = json?['paymentMethod'];
  }
}
class OrdersModel implements DecodeAble<List<OrderModel>, List?> {
  @override
  List<OrderModel> fromJson(List? json) {
    return json?.map<OrderModel>((e) => OrderModel().fromJson(e)).toList() ?? [];
  }
}

