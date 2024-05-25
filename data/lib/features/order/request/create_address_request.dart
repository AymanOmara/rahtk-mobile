import 'package:data/network/encode_able.dart';
import 'package:data/network/remote_target.dart';

class CreateAddressRequest extends IRemoteTarget {
  CreateAddressRequest({
    required EncodeAble data,
  }) : super(
          body: data.toJson(),
          method: HttpMethod.post,
          path: "/api/Address/create-address",
        );
}
