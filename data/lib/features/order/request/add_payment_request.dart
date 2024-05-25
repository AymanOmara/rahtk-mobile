import 'package:data/network/encode_able.dart';
import 'package:data/network/remote_target.dart';

class AddPaymentRequest extends IRemoteTarget {
  AddPaymentRequest({
    required EncodeAble data,
  }) : super(
          body: data.toJson(),
          path: "api/Payment/add-payment",
          method: HttpMethod.post,
        );
}
