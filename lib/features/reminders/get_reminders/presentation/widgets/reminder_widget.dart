import 'package:domain/features/reminder/entity/reminder_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/reminders/get_reminders/business_logic/get_reminders_cubit.dart';
import 'package:rahtk_mobile/features/reminders/update_reminder/display/update_reminder_display.dart';

class ReminderWidget extends StatelessWidget {
  const ReminderWidget({
    super.key,
    required this.reminder,
  });

  final ReminderEntity reminder;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GetRemindersCubit cubit = BlocProvider.of(context);
        Navigator.of(context).pushNamed(
          AppRoutes.updateReminder,
          arguments: UpdateReminderDisplay(
            updateAble: cubit,
            reminder: reminder,
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: RahtkColors.lightGray,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                0.1,
              ),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${"reminder_title".tr} ${reminder.title}",
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "${"reminder_interval".tr} ${reminder.timeInterval.toString()}",
            ),
          ],
        ),
      ),
    );
  }
}
