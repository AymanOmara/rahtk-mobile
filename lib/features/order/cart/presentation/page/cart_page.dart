import 'package:common/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/bar_icons/business_logic/bar_icons_cubit.dart';
import 'package:rahtk_mobile/features/order/cart/business_logic/cart_cubit.dart';
import 'package:rahtk_mobile/features/order/cart/presentation/widgets/add_new_address_widget.dart';
import 'package:rahtk_mobile/features/order/cart/presentation/widgets/cart_product_item_widget.dart';
import 'package:rahtk_mobile/features/order/cart/presentation/widgets/products_details.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/display/choose_payment_option_params.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartCubit, CartState>(
      listener: (context, state) {
        CartCubit cartCubit = BlocProvider.of(context);
        BarIconsCubit barIconsCubit = BlocProvider.of(context);
        barIconsCubit.updateCartProducts(
            cartCubit.products.map((e) => e.product).toList());

      },
      builder: (context, state) {
        CartCubit cubit = BlocProvider.of(context);
        BarIconsCubit barIconsCubit = BlocProvider.of(context);
        barIconsCubit
            .updateCartProducts(cubit.products.map((e) => e.product).toList());

        Logger.D("cart state $state");
        return Scaffold(
          backgroundColor: RahtkColors.aliceBlue,
          body: Column(
            children: [
              RahtkNavigationBar(
                title: "cart".tr,
              ),
              const SizedBox(
                height: 10,
              ),
              LoadingWidget(
                loadingState: cubit.loadingState,
                successWidget: const AddNewAddressWidget(),
                onRetry: () {
                  cubit.fetchAddresses();
                },
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.products.length,
                              itemBuilder: (context, index) {
                                return CartItemWidget(
                                  product: cubit.products[index],
                                );
                              },
                            ),

                            ProductsDetails(
                              products: cubit.products,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  if (cubit.address != null &&
                      (cubit.products.isNotEmpty)) {
                    Navigator.of(context).pushNamed(
                      AppRoutes.paymentOptions,
                      arguments: ChoosePaymentOptionParams(
                        products: cubit.products,
                        address: cubit.address!,
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  width: Get.width - 40,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: cubit.address == null || (cubit.products.isEmpty)
                        ? RahtkColors.tealColor.withOpacity(0.4)
                        : RahtkColors.tealColor,
                  ),
                  child: Text(
                    "continue_to_payment".tr,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
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
