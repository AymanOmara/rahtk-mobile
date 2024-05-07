import 'package:data/network/encode_able.dart';
import 'package:data/network/remote_target.dart';

class RegistrationRequest extends IRemoteTarget {
  final EncodeAble encodeAble;

  RegistrationRequest({required this.encodeAble}) {
    body = encodeAble.toJson();
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => "api/User/register";
}
