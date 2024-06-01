import 'package:data/features/profile/model/notification_model.dart';
import 'package:domain/features/profile/entity/notification_entity.dart';

extension NotificationMapper on NotificationModel {
  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id ?? 0,
      title: title ?? "",
      date: date ?? "",
      body: body ?? "",
    );
  }
}
