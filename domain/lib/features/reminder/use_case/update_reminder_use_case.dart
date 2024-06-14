import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:domain/features/reminder/entity/update_reminder_entity.dart';
import 'package:domain/features/reminder/repository/i_reminder_repository.dart';

class UpdateReminderUseCase{
  final IReminderRepository _reminderRepository;
  const UpdateReminderUseCase(this._reminderRepository);

  Future<Result<Response<ReminderEntity>, NetworkException>> call(UpdateReminderEntity reminder)async{
    return await _reminderRepository.updateReminder(reminder);
  }
}