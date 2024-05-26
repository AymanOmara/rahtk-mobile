import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/profile/entity/profile_entity.dart';

abstract interface class IProfileRepository{

  Future<Result<ProfileEntity?, NetworkException>> getProfile();
}