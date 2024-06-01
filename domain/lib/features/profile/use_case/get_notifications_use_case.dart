import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/profile/entity/notification_entity.dart';
import 'package:domain/features/profile/repository/i_profile_repository.dart';

class GetNotificationsUseCase {
  final IProfileRepository _repository;

  const GetNotificationsUseCase(this._repository);

  Future<Result<List<NotificationEntity>, NetworkException>> call() async {
    return await _repository.getNotifications();
  }
}
