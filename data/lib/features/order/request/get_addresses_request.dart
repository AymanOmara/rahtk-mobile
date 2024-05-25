import 'package:data/network/remote_target.dart';

class GetAddressesRequest extends IRemoteTarget {
  GetAddressesRequest()
      : super(
          path: "api/Address/get-address",
        );
}
