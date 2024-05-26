import 'package:data/network/decode_able.dart';

class ProfileModel implements DecodeAble<ProfileModel, Map?> {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;

  @override
  ProfileModel fromJson(Map? json) {
    return ProfileModel()
      ..id = json?['id']
      ..name = json?['userName']
      ..email = json?['email']
      ..phoneNumber = json?['phoneNumber'];
  }
}
