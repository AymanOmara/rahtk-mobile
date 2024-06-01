import 'package:data/common/response_entity_mapper.dart';
import 'package:data/features/profile/mapper/notification_mapper.dart';
import 'package:data/features/profile/mapper/profile_entity_mapper.dart';
import 'package:data/features/profile/model/notification_model.dart';
import 'package:data/features/profile/model/profile_model.dart';
import 'package:data/features/profile/request/get_notifications_request.dart';
import 'package:data/features/profile/request/get_profile_request.dart';
import 'package:data/features/profile/request/logout_request.dart';
import 'package:data/network/i_base_api.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/network/response.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/profile/entity/notification_entity.dart';
import 'package:domain/features/profile/entity/profile_entity.dart';
import 'package:domain/features/profile/repository/i_profile_repository.dart';
import 'package:domain/locale_storage/i_user_local.dart';

class ProfileRepository implements IProfileRepository {
  final IAPIService _service;
  final IUserLocal _iUserLocal;

  const ProfileRepository(
    this._service,
    this._iUserLocal,
  );

  @override
  Future<Result<ProfileEntity?, NetworkException>> getProfile() async {
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

  @override
  Future<Result<List<NotificationEntity>, NetworkException>>
      getNotifications() async {
    var result = await _service.fetchData<List<NotificationModel>>(
        GetNotificationsRequest(),
        data: NotificationsModel());
    switch (result) {
      case Success(data: final data):
        return Success(data.data?.map((e) => e.toEntity()).toList() ?? []);
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }

  @override
  Future<Result<Response<bool>, NetworkException>> logout() async {
    var result = await _service.fetchData<bool>(LogoutRequest());
    switch (result) {
      case Success(data: final data):
        if(data.statusCode == 200){
          _iUserLocal.logout();
        }
        return Success(data.toEntity(data.data ?? false));
      case Failure(exception: final exception):
        return Failure(exception);
    }
  }
}
