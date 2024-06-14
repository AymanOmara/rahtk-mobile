import 'package:data/network/remote_target.dart';

class DeleteReminderRequest extends IRemoteTarget {
  DeleteReminderRequest({required Map data})
      : super(
          body: data,
          path: "api/Reminder/delete-reminder",
          method: HttpMethod.delete,
        );
}
