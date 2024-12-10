import 'decode_able.dart';

class BaseResponse<T> implements DecodeAble<BaseResponse<T?>, Map?> {
  DecodeAble? decodeAble;
  T? data;
  String? message;
  bool? success;
  int? statusCode;

  BaseResponse({
    this.decodeAble,
    this.data,
    this.message,
    this.statusCode,
    this.success,
  });

  @override
  BaseResponse<T?> fromJson(json) {
    return BaseResponse<T?>(
      data: json?.containsKey("data") == true
          ? decodeAble?.fromJson(json?["data"] ?? {})
          : null,
      message: json?["message"],
      statusCode: json?["statusCode"],
      success: json?["success"],
    );
  }
}
