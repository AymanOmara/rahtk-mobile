import 'decode_able.dart';

class BaseResponse<T> implements DecodeAble<BaseResponse<T?>, Map?> {
  DecodeAble? decodeAble;
  T? data;
  String? message;
  bool? success;
  int? statusCode;

  BaseResponse({
    this.decodeAble,
  });

  @override
  BaseResponse<T?> fromJson(json) {
    var response = BaseResponse<T?>()
      ..data = json?.containsKey("data") == true
          ? decodeAble?.fromJson(json?["data"] ?? {})
          : null
      ..message = json?["message"]
      ..statusCode = json?["statusCode"]
      ..success = json?["success"];

    return response;
  }
}
