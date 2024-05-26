import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/order_history/business_logic/order_history_cubit.dart';
import 'package:rahtk_mobile/features/main/order_history/presentation/widgets/order_history_widget.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderHistoryCubit(diInjector()),
      child: BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          OrderHistoryCubit cubit = BlocProvider.of(context);
          return Container(
            width: Get.width,
            color: RahtkColors.aliceBlue,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  decoration: const BoxDecoration(
                    color: RahtkColors.tealColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "order_history".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).pushNamed(AppRoutes.favorites);
                                },
                                child: SvgPicture.asset(
                                  "assets/images/favorite_ic.svg",
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).pushNamed(AppRoutes.cart);
                                },
                                child: SvgPicture.asset(
                                  "assets/images/cart_ic.svg",
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: LoadingWidget(
                    loadingState: cubit.loadingState,
                    onRetry: (){
                      cubit.fetchOrders();
                    },
                    successWidget: RefreshIndicator(
                      onRefresh: ()async{
                        cubit.fetchOrders();
                      },
                      child: ListView(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        children: cubit.orders.map((e)=>OrderHistoryWidget(order: e)).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
