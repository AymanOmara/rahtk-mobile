import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/features/notifications/business_logic/notifications_cubit.dart';
import 'package:rahtk_mobile/features/notifications/presentation/widgets/notification_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        NotificationsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              RahtkNavigationBar(
                title: "notifications".tr,
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loadingState,
                  successWidget: ListView(
                    shrinkWrap: true,
                    children: cubit.notifications.take(10)
                        .map((e) => NotificationWidget(notification: e))
                        .toList(),
                  ),
                  onRetry: () {
                    cubit.fetchNotifications();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
