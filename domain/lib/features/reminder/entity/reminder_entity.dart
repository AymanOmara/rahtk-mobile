import 'package:domain/features/product/entity/product_entity.dart';

class ReminderEntity {
  final int id;
  String title;
  int timeInterval;
  List<ProductEntity> products;

  ReminderEntity({
    required this.id,
    required this.title,
    required this.timeInterval,
    required this.products,
  });
}
