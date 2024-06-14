import 'package:data/features/products/mapper/product_entity_to_model_mapper.dart';
import 'package:data/features/reminder/model/add_reminder_model.dart';
import 'package:domain/features/product/entity/add_reminder_entity.dart';

extension AddReminderModelMapper on AddReminderEntity {
  AddReminderModel get toModel => AddReminderModel(
        title: title,
        timeInterval: timeInterval,
        products: products.map((e) => e.toModel).toList(),
      );
}
