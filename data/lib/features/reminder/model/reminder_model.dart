import 'package:data/features/products/model/product_model.dart';
import 'package:data/network/decode_able.dart';

class ReminderModel implements DecodeAble<ReminderModel, Map?>{
  int? id;
  String? title;
  int? timeInterval;
  List<ProductModel>? products;
  @override
  ReminderModel fromJson(Map? json) {
    return ReminderModel()
      ..id = json?['id']
      ..title = json?['title']
      ..timeInterval = json?['reminderIntervalDays']
      ..products = (json?['products'] as List?)?.map<ProductModel>((e) => ProductModel().fromJson(e)).toList();
  }

}