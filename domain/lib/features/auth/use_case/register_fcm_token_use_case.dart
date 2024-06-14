import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/repositories/i_auth_repository.dart';

class RegisterFcmTokenUseCase {
  final IAuthRepository _authRepository;

  const RegisterFcmTokenUseCase(this._authRepository);

  Future<Result<Response<bool>, NetworkException>> call() async {
    return await _authRepository.registerFcmToken();
  }
}
