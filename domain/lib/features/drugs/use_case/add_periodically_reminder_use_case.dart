import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/drugs/repository/i_drugs_repository.dart';

class AddPeriodicallyReminderUseCase {
  final IDrugsRepository _drugsRepository;

  const AddPeriodicallyReminderUseCase(this._drugsRepository);

  Future<Result<Response<bool>, NetworkException>> call(int drugId , int duration) async {
    return _drugsRepository.addReminder(drugId, duration);
  }
}
