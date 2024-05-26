import 'package:data/network/remote_target.dart';

class GetOrdersRequest extends IRemoteTarget {
  GetOrdersRequest() : super(path: "api/Order/get-orders");
}
