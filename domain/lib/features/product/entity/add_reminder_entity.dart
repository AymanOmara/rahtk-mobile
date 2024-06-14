import 'package:domain/features/product/entity/product_entity.dart';

class AddReminderEntity {
  final String title;
  final int timeInterval;
  final List<ProductEntity> products;

  AddReminderEntity({
    required this.title,
    required this.timeInterval,
    required this.products,
  });
}
