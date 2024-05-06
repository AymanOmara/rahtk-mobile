import 'package:data/features/auth/model/token.dart';
import 'package:domain/features/auth/entities/token_entity.dart';

extension TokenMapper on TokenModel? {
  TokenEntity toEntity() {
    return TokenEntity(
      accessToken: this?.token ?? "",
      refreshToken: this?.refreshToken ?? "",
    );
  }
}
