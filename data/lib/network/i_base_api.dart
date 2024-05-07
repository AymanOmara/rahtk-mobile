import 'package:data/network/remote_target.dart';
import 'package:domain/common/network/exceptions/network_exception.dart';
import 'package:domain/common/result.dart';

import 'base_response.dart';
import 'decode_able.dart';

abstract interface class IAPIService {
  Future<Result<BaseResponse<T?>, NetworkException>> fetchData<T>(
    IRemoteTarget targetType, {
    DecodeAble? data,
  });
}
