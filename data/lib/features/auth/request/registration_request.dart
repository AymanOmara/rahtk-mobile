import 'package:data/network/encode_able.dart';
import 'package:data/network/remote_target.dart';

class RegistrationRequest extends IRemoteTarget {
  final EncodeAble data;

  RegistrationRequest({required this.data}) {
    body = data.toJson();
  }

  @override
  HttpMethod get method => HttpMethod.post;

  @override
  String? get path => "api/User/register";
}
