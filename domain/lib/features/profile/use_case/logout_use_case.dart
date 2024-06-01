import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/profile/repository/i_profile_repository.dart';

class LogoutUseCase {
  final IProfileRepository _repository;

  const LogoutUseCase(this._repository);

  Future<Result<Response<bool>, NetworkException>> call() async {
    return await _repository.logout();
  }

}