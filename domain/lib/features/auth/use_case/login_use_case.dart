import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/entities/token_entity.dart';
import 'package:domain/features/auth/repositories/i_auth_repository.dart';

class LoginUseCase {
  final IAuthRepository _repository;

  const LoginUseCase(this._repository);

  Future<Result<Response<TokenEntity>, NetworkException>> call(
    String email,
    String password,
  ) async {
    return await _repository.login(email, password);
  }
}
