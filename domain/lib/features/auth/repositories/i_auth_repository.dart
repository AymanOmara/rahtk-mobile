import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/entities/forget_password_entity.dart';
import 'package:domain/features/auth/entities/registration_entity.dart';
import 'package:domain/features/auth/entities/token_entity.dart';

abstract interface class IAuthRepository{
  Future<Result<Response<TokenEntity>,NetworkException>> login(String email,String password);

  Future<Result<Response<bool>,NetworkException>> verifyEmail(String email);

  Future<Result<Response<bool>,NetworkException>> registration(RegistrationEntity entity);

  Future<Result<Response<bool>,NetworkException>> verifyOtp(String otp,String email);

  Future<Result<Response<bool>,NetworkException>> forgetPassword(ForgetPasswordEntity entity);

  Future<Result<Response<bool>,NetworkException>> registerFcmToken();
}