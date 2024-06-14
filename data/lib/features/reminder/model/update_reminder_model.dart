import 'package:data/features/reminder/model/add_reminder_model.dart';
import 'package:data/network/encode_able.dart';

class UpdateReminderModel extends AddReminderModel implements EncodeAble {
  final int id;

  UpdateReminderModel({
    required this.id,
    required super.title,
    required super.timeInterval,
    required super.products,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "reminderIntervalDays": timeInterval,
      "products": products.map((e) => e.toJson()).toList(),
    };
  }
}
