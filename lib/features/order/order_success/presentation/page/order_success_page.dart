import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/order/order_success/order_success_params_display.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/features/order/order_success/presentation/widgets/success_order_item_widget.dart';
import 'package:rahtk_mobile/features/order/order_success/presentation/widgets/tarck_order_widget.dart';

class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({
    super.key,
    required this.orderSuccessParamsDisplay,
  });

  final OrderSuccessParamsDisplay orderSuccessParamsDisplay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: RahtkColors.aliceBlue,
      body: Column(
        children: [
          Container(
            height: 140,
            width: Get.width,
            decoration: const BoxDecoration(
              color: RahtkColors.tealColor,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "order_details".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.home,
                                (Route<dynamic> route) => false,
                              );
                            },
                            icon: const Icon(
                              Icons.close,
                              size: 50,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset("assets/images/order_success_ic.svg"),
          Text(
            "thank_you_for_order".tr,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: RahtkColors.darkGray,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children:
                        orderSuccessParamsDisplay.paymentOptionParams.products
                            .map((e) => SuccessOrderItemWidget(
                                  product: e,
                                ))
                            .toList(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    width: Get.width,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TrackOrderWidget(
                        orderSuccessParamsDisplay: orderSuccessParamsDisplay),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "delivery_address".tr,
                            style: const TextStyle(
                              color: RahtkColors.darkGray,
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              Text(
                                orderSuccessParamsDisplay
                                    .paymentOptionParams.address
                                    .toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: RahtkColors.darkGray,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                orderSuccessParamsDisplay
                                    .paymentOptionParams.address.city,
                                style: const TextStyle(
                                  color: RahtkColors.darkGray,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: (){

                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.home,
                        (Route<dynamic> route) => false,
                      );
                    },
                    child: Text(
                      "back_to_home".tr,
                      style:const TextStyle(
                        color: RahtkColors.darkGray,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
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
