import 'package:data/network/remote_target.dart';

class CreateReminderRequest extends IRemoteTarget {
  CreateReminderRequest({
    required Map data,
  }) : super(
          body: data,
          method: HttpMethod.post,
          path: "api/Reminder/add-reminder",
        );
}
