import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/features/main/order_history/business_logic/order_history_cubit.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderHistoryCubit(),
      child: BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "order_history".tr,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
