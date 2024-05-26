import 'package:data/network/remote_target.dart';

class GetProfileRequest extends IRemoteTarget {
  GetProfileRequest()
      : super(
          path: "api/User/get-profile",
        );
}
