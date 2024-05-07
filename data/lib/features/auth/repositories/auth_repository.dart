import 'package:data/common/response_entity_mapper.dart';
import 'package:data/features/auth/mappers/token_mapper.dart';
import 'package:data/features/auth/model/token.dart';
import 'package:data/features/auth/request/email_verification_request.dart';
import 'package:data/features/auth/request/login_request.dart';
import 'package:data/features/auth/request/verify_otp_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/entities/registration_entity.dart';
import 'package:domain/features/auth/entities/token_entity.dart';
import 'package:domain/features/auth/repositories/i_auth_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class AuthRepository implements IAuthRepository {
  final IAPIService _service;
  final IUserLocal _userLocal;

  const AuthRepository(
    this._service,
    this._userLocal,
  );

  @override
  Future<Result<Response<TokenEntity>, NetworkException>> login(
      String email, String password) async {
    var result = await _service.fetchData<TokenModel>(
        LoginRequest(email: email, password: password),
        data: TokenModel());
    switch (result) {
      case Success(data: final data):
        if (data.statusCode == 200) {
          _userLocal.setAccessToken(data.data?.token ?? "");
          _userLocal.setRefreshToken(data.data?.refreshToken ?? "");
        }
        return Success(data.toEntity(data.data.toEntity()));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<bool>, NetworkException>> verifyEmail(
      String email) async {
    var result =
        await _service.fetchData<bool>(EmailVerificationRequest(email: email));
    switch (result) {
      case Success(data: final data):
        return Success(data.toEntity(data.data ?? false));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<bool>, NetworkException>> registration(
      RegistrationEntity entity) {
    // TODO: implement registration
    throw UnimplementedError();
  }

  @override
  Future<Result<Response<bool>, NetworkException>> verifyOtp(
      String otp, String email) async {
    var result =
        await _service.fetchData(VerifyOtpRequest(email: email, otp: otp));
    switch (result) {
      case Success(data: final data):
        return Success(data.toEntity(data.data ?? false));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }
}
