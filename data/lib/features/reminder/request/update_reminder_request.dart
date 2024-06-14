
import 'package:data/network/remote_target.dart';

class UpdateReminderRequest extends IRemoteTarget {
  UpdateReminderRequest({
    required Map data,
  }) : super(
          path: 'api/Reminder/update-reminder',
          body: data,
          method: HttpMethod.put,
        );
}
