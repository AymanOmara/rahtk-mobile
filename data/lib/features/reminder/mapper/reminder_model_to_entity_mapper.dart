import 'package:data/features/products/mapper/product_mapper.dart';
import 'package:data/features/reminder/model/reminder_model.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';

extension ReminderModelToEntityMapper on ReminderModel? {
  ReminderEntity  toEntity() => ReminderEntity(
        id: this?.id ?? 0,
        title: this?.title ?? "",
        timeInterval: this?.timeInterval ?? 0,
        products: this?.products?.map((e) => e.toEntity()).toList() ?? [],
      );
}
