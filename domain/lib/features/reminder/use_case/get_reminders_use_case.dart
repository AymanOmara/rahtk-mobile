import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:domain/features/reminder/repository/i_reminder_repository.dart';

class GetRemindersUseCase {
  final IReminderRepository _reminderRepository;

  const GetRemindersUseCase(this._reminderRepository);

  Future<Result<List<ReminderEntity>, NetworkException>> call() async {
    return await _reminderRepository.getReminders();
  }
}
