import 'package:data/network/encode_able.dart';
import 'package:data/network/remote_target.dart';

class CreateOrderRequest extends IRemoteTarget {
  CreateOrderRequest({required EncodeAble data})
      : super(
          body: data.toJson(),
          path: "api/Order/create-order",
          method: HttpMethod.post,
        );
}
