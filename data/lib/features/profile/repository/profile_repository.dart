import 'package:data/features/profile/mapper/profile_entity_mapper.dart';
import 'package:data/features/profile/model/profile_model.dart';
import 'package:data/features/profile/request/get_profile_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/profile/entity/profile_entity.dart';
import 'package:domain/features/profile/repository/i_profile_repository.dart';

class ProfileRepository implements IProfileRepository{
  final IAPIService _service;
  const ProfileRepository(this._service);

  @override
  Future<Result<ProfileEntity?, NetworkException>> getProfile() async{
    var result = await _service.fetchData<ProfileModel>(
      GetProfileRequest(),
      data: ProfileModel(),
    );
    switch (result) {
      case Success(data: final data):
        return Success(data.data?.toEntity());
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

}