import 'package:data/features/reminder/model/reminder_model.dart';
import 'package:data/network/decode_able.dart';

class RemindersModel implements DecodeAble<List<ReminderModel>, List?> {
  @override
  List<ReminderModel> fromJson(List? json) {
    return json
            ?.map<ReminderModel>((e) => ReminderModel().fromJson(e))
            .toList() ??
        [];
  }
}
