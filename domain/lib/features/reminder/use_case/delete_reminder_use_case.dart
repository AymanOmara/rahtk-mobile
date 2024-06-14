import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/reminder/entity/update_reminder_entity.dart';
import 'package:domain/features/reminder/repository/i_reminder_repository.dart';

class DeleteReminderUseCase{
  final IReminderRepository _reminderRepository;

  const DeleteReminderUseCase(this._reminderRepository);

  Future<Result<Response<bool>, NetworkException>> call(UpdateReminderEntity deleteReminderEntity) async{
    return await _reminderRepository.deleteReminder(deleteReminderEntity);
  }
}