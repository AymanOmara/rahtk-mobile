import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:rahtk_mobile/core/display/i_update_able.dart';

class UpdateReminderDisplay {
  final IUpdateAble<ReminderEntity> updateAble;
  final ReminderEntity reminder;

  UpdateReminderDisplay({
    required this.updateAble,
    required this.reminder,
  });
}
