import 'package:data/network/remote_target.dart';

class GetRemindersRequest extends IRemoteTarget{
  GetRemindersRequest():super(path: "api/Reminder/get-reminders");
}