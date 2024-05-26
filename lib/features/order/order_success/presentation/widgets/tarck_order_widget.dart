import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/order/order_success/order_success_params_display.dart';

class TrackOrderWidget extends StatelessWidget {
  const TrackOrderWidget({super.key, required this.orderSuccessParamsDisplay});

  final OrderSuccessParamsDisplay orderSuccessParamsDisplay;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "track_order".tr,
          style: const TextStyle(
            color: RahtkColors.darkGray,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text("${"order_id".tr} ${orderSuccessParamsDisplay.orderId}"),
        Stepper(
          margin: EdgeInsets.zero,
          connectorColor: WidgetStateColor.resolveWith(
            (states) => states.contains(WidgetState.disabled)
                ? Colors.grey
                : RahtkColors.tealColor,
          ),
          physics: const NeverScrollableScrollPhysics(),
          steps: [
            Step(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("order_placed".tr),
                  Text(DateFormat("dd/MM/yyyy").format(DateTime.now())),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${"order".tr} ${orderSuccessParamsDisplay.orderId}"),
                  Text(
                    DateFormat("hh:mm a").format(DateTime.now()),
                  ),
                ],
              ),
              content: const SizedBox(),
              isActive: true,
              state: StepState.complete,
            ),
            Step(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("payment_confirmed".tr),
                  Text(DateFormat("dd/MM/yyyy").format(DateTime.now())),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("payment_status".tr),
                  Text(
                    DateFormat("hh:mm a").format(DateTime.now()),
                  ),
                ],
              ),
              content:const SizedBox(),
              isActive: true,
              state: StepState.complete,
            ),
            Step(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("processed".tr),
                  Text(DateFormat("dd/MM/yyyy").format(DateTime.now())),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("processed_status".tr),
                  Text(DateFormat("hh:mm a").format(DateTime.now())),
                ],
              ),
              content:const SizedBox(),
              isActive: true,
              state: StepState.complete,
            ),
            Step(
              title:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("delivery".tr),
                  Text(DateFormat("dd/MM/yyyy").format(DateTime.now())),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("delivery_status".tr),
                  Text(DateFormat("hh:mm a").format(DateTime.now())),
                ],
              ),
              content: const SizedBox(),
              isActive: false,
              state: StepState.disabled,
            ),
          ],
          currentStep: 3,
          onStepTapped: (int step) {},
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Container(); // Disable the default controls
          },
        ),
      ],
    );
  }
}
