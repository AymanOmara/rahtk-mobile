import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/auth/entities/token_entity.dart';

abstract interface class IAuthRepository{
  Future<Result<Response<TokenEntity>,NetworkException>> login(String email,String password);
}