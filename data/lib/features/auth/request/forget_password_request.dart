import 'package:data/network/encode_able.dart';
import 'package:data/network/remote_target.dart';

class ForgetPasswordRequest extends IRemoteTarget {
  final EncodeAble data;

  ForgetPasswordRequest({
    required this.data,
  }) {
    body = data.toJson();
  }

  @override
  String? get path => "api/User/forget-password";

  @override
  HttpMethod get method => HttpMethod.post;
}
