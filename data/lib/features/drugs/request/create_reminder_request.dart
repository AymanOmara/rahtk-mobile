import 'package:data/network/remote_target.dart';

class CreateReminderRequest extends IRemoteTarget {
  CreateReminderRequest({required int drugId, required int duration})
      : super(
          body: {
            "drugId": drugId,
            "reminderIntervalDays": duration,
          },
          method: HttpMethod.post,
          path: "api/Drug/add-reminder",
        );
}
