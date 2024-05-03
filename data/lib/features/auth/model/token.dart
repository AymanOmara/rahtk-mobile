import 'package:data/network/decode_able.dart';

class TokenModel implements DecodeAble<TokenModel?, Map<String, dynamic>> {
  String? token, refreshToken, status;
  bool? isAdmin;

  @override
  TokenModel? fromJson(Map json) {
    return TokenModel()
      ..token = json['token']?.toString()
      ..refreshToken = json['refreshToken']?.toString()
      ..isAdmin = json["isAdmin"]
      ..status = json['status']?.toString();
  }
}
