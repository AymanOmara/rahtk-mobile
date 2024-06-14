import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/entity/add_reminder_entity.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:domain/features/reminder/entity/update_reminder_entity.dart';

abstract interface class IReminderRepository {
  Future<Result<List<ReminderEntity>, NetworkException>> getReminders();

  Future<Result<Response<ReminderEntity>, NetworkException>> addReminder(
    AddReminderEntity reminder,
  );

  Future<Result<Response<ReminderEntity>, NetworkException>> updateReminder(
    UpdateReminderEntity reminder,
  );

  Future<Result<Response<bool>, NetworkException>> deleteReminder(
    UpdateReminderEntity reminder,
  );
}
