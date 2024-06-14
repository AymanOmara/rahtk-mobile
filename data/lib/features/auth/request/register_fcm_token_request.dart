import 'package:data/network/remote_target.dart';

class RegisterFcmTokenRequest extends IRemoteTarget {
  RegisterFcmTokenRequest({required String fcmToken})
      : super(
          queryParameters: {"fcmToken": fcmToken},
          method: HttpMethod.post,
          path: "api/User/register-fcm-token",
        );
}
