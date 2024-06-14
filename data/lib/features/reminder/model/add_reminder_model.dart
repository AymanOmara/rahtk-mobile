import 'package:data/features/products/model/product_model.dart';
import 'package:data/network/encode_able.dart';

class AddReminderModel implements EncodeAble {
  final String title;
  final int timeInterval;
  final List<ProductModel> products;

  AddReminderModel({
    required this.title,
    required this.timeInterval,
    required this.products,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "reminderIntervalDays": timeInterval,
      "products": products.map((e) => e.toJson()).toList(),
    };
  }
}
