import 'package:data/features/profile/model/profile_model.dart';
import 'package:domain/features/profile/entity/profile_entity.dart';

extension ProfileEntityMapper on ProfileModel {
  ProfileEntity toEntity() {
    return ProfileEntity(
      name: name ?? "",
      email: email ?? "",
      phone: phoneNumber ?? "",
    );
  }
}
