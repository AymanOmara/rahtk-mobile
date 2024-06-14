import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/page_header.dart';
import 'package:rahtk_mobile/features/reminders/get_reminders/business_logic/get_reminders_cubit.dart';
import 'package:rahtk_mobile/features/reminders/get_reminders/presentation/widgets/reminder_widget.dart';

class GetRemindersPage extends StatelessWidget {
  const GetRemindersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetRemindersCubit, GetRemindersState>(
      listener: (context, state) {},
      builder: (context, state) {
        GetRemindersCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              PageHeader(title: "reminders".tr),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.addReminder,
                    arguments: cubit,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "add_reminder".tr,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loadingState,
                  successWidget: ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var reminder = cubit.reminders[index];
                      return ReminderWidget(reminder: reminder);
                    },
                    itemCount: cubit.reminders.length,
                  ),
                  onRetry: () => cubit.fetchReminders(),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
