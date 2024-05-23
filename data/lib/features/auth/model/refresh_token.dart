import 'package:data/network/decode_able.dart';
class RefreshTokenModel implements DecodeAble<RefreshTokenModel?, Map<String, dynamic>> {
  String? token, refreshToken, status;

  @override
  RefreshTokenModel? fromJson(Map json) {
    return RefreshTokenModel()
      ..token = json['accessToken']?.toString()
      ..refreshToken = json['refreshToken']?.toString()
      ..status = json['status']?.toString();
  }
}