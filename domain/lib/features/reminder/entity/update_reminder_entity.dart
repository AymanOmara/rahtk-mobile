import 'package:domain/features/product/entity/Add_reminder_entity.dart';

class UpdateReminderEntity extends AddReminderEntity {
  final int id;

  UpdateReminderEntity({
    required this.id,
    required super.title,
    required super.timeInterval,
    required super.products,
  });
}
