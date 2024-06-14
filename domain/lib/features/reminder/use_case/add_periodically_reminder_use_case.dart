import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/entity/add_reminder_entity.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:domain/features/reminder/repository/i_reminder_repository.dart';

class AddPeriodicallyReminderUseCase {
  final IReminderRepository _reminderRepository;

  const AddPeriodicallyReminderUseCase(this._reminderRepository);

  Future<Result<Response<ReminderEntity>, NetworkException>> call(AddReminderEntity reminder) async {
    return _reminderRepository.addReminder(reminder);
  }
}
