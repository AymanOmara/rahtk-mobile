import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/profile/entity/profile_entity.dart';
import 'package:domain/features/profile/repository/i_profile_repository.dart';

class GetProfileInfoUseCase {
  final IProfileRepository _repository;

  const GetProfileInfoUseCase(this._repository);

  Future<Result<ProfileEntity?, NetworkException>> call() async {
    return await _repository.getProfile();
  }
}
