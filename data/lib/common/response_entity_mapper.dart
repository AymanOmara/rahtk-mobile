import 'package:data/network/base_response.dart';
import 'package:domain/common/network/response.dart';

extension ResponseEntityMapper on BaseResponse {
  Response<T> toEntity<T>(T data) {
    return Response<T>(
      data: data,
      statusCode: statusCode ?? 400,
      success: success ?? false,
      message: message ?? "",
    );
  }
}
