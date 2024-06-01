import 'package:data/network/remote_target.dart';

class LogoutRequest extends IRemoteTarget {
  LogoutRequest()
      : super(
          path: 'api/User/logout',
          method: HttpMethod.post,
        );
}
