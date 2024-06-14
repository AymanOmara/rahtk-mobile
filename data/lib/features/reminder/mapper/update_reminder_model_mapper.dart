import 'package:data/features/products/mapper/product_entity_to_model_mapper.dart';
import 'package:data/features/reminder/model/update_reminder_model.dart';
import 'package:domain/features/reminder/entity/update_reminder_entity.dart';

extension UpdateReminderModelMapper on UpdateReminderEntity {
  UpdateReminderModel get toModel => UpdateReminderModel(
        id: id,
        title: title,
        timeInterval: timeInterval,
        products: products.map((e) => e.toModel).toList(),
      );
}
