import 'package:data/network/remote_target.dart';

class GetPaymentsRequest extends IRemoteTarget{
  GetPaymentsRequest():super(path: "api/Payment/get-payments");
}