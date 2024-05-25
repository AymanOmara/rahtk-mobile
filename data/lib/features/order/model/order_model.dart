import 'package:data/features/order/model/Payment_model.dart';
import 'package:data/features/order/model/address_model.dart';
import 'package:data/network/decode_able.dart';

import 'order_item.dart';

class OrderModel implements DecodeAble<OrderModel,Map?> {
  List<OrderItem>? items;
  AddressModel? address;
  PaymentModel? payment;
  int? id;
  String? date;
  String? paymentMethod;

  @override
  OrderModel fromJson(Map? json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
}
