import 'package:data/network/decode_able.dart';

class NotificationModel implements DecodeAble<NotificationModel, Map?> {
  int? id;
  String? title;
  String? body;
  String? date;

  @override
  NotificationModel fromJson(Map? json) {
    return NotificationModel()
      ..id = json?["id"]
      ..title = json?["title"]
      ..body = json?["body"]
      ..date = json?["date"];
  }
}

class NotificationsModel implements DecodeAble<List<NotificationModel>, List?> {
  @override
  List<NotificationModel> fromJson(List? json) {
    return json
            ?.map<NotificationModel>((e) => NotificationModel().fromJson(e))
            .toList() ??
        [];
  }
}
