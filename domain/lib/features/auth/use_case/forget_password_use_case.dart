import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/entities/forget_password_entity.dart';
import 'package:domain/features/auth/repositories/i_auth_repository.dart';

class ForgetPasswordUseCase {
  final IAuthRepository _repository;

  ForgetPasswordUseCase(this._repository);

  Future<Result<Response<bool>, NetworkException>> call(
    ForgetPasswordEntity entity,
  ) async {
    return await _repository.forgetPassword(entity);
  }
}
