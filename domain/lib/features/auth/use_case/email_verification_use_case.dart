import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/repositories/i_auth_repository.dart';

class EmailVerificationUseCase{
  final IAuthRepository _authRepository;

  const EmailVerificationUseCase(this._authRepository);
  Future<Result<Response<bool>,NetworkException>> call(String email) async => await _authRepository.verifyEmail(email);
}