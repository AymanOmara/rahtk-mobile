import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/business_logic/choose_payment_option_cubit.dart';
class AddPaymentMethodWidget extends StatelessWidget {
  const AddPaymentMethodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ChoosePaymentOptionCubit cubit = context.watch();
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .pushNamed(AppRoutes.addPayment, arguments: cubit);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: Get.width,
            height: 250,
            color: Colors.white,
          ),
          DottedBorder(
            radius: const Radius.circular(20),
            borderType: BorderType.RRect,
            color: Colors.black.withOpacity(0.2),
            dashPattern: const [6, 3],
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "add_payment_method".tr,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
