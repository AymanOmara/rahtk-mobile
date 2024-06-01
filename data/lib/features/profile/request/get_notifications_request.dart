import 'package:data/network/remote_target.dart';

class GetNotificationsRequest extends IRemoteTarget{
  GetNotificationsRequest():super(path: "api/User/get-notifications");
}