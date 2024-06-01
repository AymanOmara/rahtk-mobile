import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/entity/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/display/i_add_able.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/bar_icons/business_logic/bar_icons_cubit.dart';
import 'package:rahtk_mobile/features/on_board/presentation/widgets/dotted_widget.dart';
import 'package:rahtk_mobile/features/order/cart/business_logic/cart_cubit.dart';
import 'package:rahtk_mobile/features/order/cart/presentation/widgets/products_details.dart';
import 'package:rahtk_mobile/features/order/order_success/order_success_params_display.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/business_logic/choose_payment_option_cubit.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/presentation/widgets/add_payment_method_widget.dart';
import 'package:rahtk_mobile/features/order/payment/choose_payment_option/presentation/widgets/current_payment_card.dart';

class ChoosePaymentOptionPage extends StatelessWidget {
  const ChoosePaymentOptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChoosePaymentOptionCubit, ChoosePaymentOptionState>(
      listener: (context, state) {
        if (state is ChoosePaymentOptionCreateOrderResult) {
          Get.snackbar(
              state.success ? "success".tr : "error".tr, state.message.tr);
          if (state.success) {
            ChoosePaymentOptionCubit cubit = BlocProvider.of(context);
            CartCubit cartCubit = BlocProvider.of(context);
            cartCubit.clearCartProduct();
            BlocProvider.of<BarIconsCubit>(context).updateCartProducts([]);
            Navigator.of(context).pushNamed(
              AppRoutes.orderSuccess,
              arguments: OrderSuccessParamsDisplay(
                paymentOptionDisplay:
                    cubit.paymentOptions.firstWhereOrNull((e) => e.selected),
                paymentOptionParams: cubit.params,
                orderId: state.orderId,
              ),
            );
          }
        }
      },
      builder: (context, state) {
        ChoosePaymentOptionCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: RahtkColors.aliceBlue,
          body: Column(
            children: [
              RahtkNavigationBar(
                title: "payment_option".tr,
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loadingState,
                  onRetry: () {
                    cubit.fetchPaymentOptions();
                  },
                  successWidget: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              SizedBox(
                                child: SizedBox(
                                  height: 300,
                                  width: Get.width - 30,
                                  child: PageView(
                                    onPageChanged: (pageIndex) {
                                      cubit.updatePageIndex(pageIndex);
                                    },
                                    children: [
                                      ...cubit.paymentOptions
                                          .map<Widget>((e) =>
                                              CurrentPaymentCard(
                                                  paymentOptionEntity: e))
                                          .toList(),
                                      if (cubit.paymentOptions.length < 3)
                                        const AddPaymentMethodWidget()
                                    ],
                                  ),
                                ),
                              ),
                              DottedWidget(
                                totalSlides: cubit.paymentOptions.length < 3
                                    ? cubit.paymentOptions.length + 1
                                    : cubit.paymentOptions.length,
                                currentIndex: cubit.pageIndex,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: Get.width,
                          color: Colors.white,
                          child: Column(
                            children: [
                              RadioListTile<PaymentMethods>(
                                activeColor: RahtkColors.tealColor,
                                title: Text(
                                  "debit_credit_card".tr,
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                value: PaymentMethods.debitCreditCard,
                                groupValue: cubit.paymentMethod,
                                onChanged: (method) {
                                  if (method != null) {
                                    cubit.updatePaymentMethod(method);
                                  }
                                },
                              ),
                              const Divider(),
                              RadioListTile<PaymentMethods>(
                                activeColor: RahtkColors.tealColor,
                                title: Text(
                                  "cash_on_delivery".tr,
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                value: PaymentMethods.cash,
                                groupValue: cubit.paymentMethod,
                                onChanged: (PaymentMethods? method) {
                                  if (method != null) {
                                    cubit.updatePaymentMethod(method);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          color: Colors.white,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  cubit.params.address.toString(),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: RahtkColors.darkGray,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    AppRoutes.addAddress,
                                    arguments: FakeSubject(cubit),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: RahtkColors.tealColor,
                                  ),
                                  child: Text(
                                    "change".tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        ProductsDetails(
                          horizontalPadding: 10,
                          products: cubit.params.products,
                        ),
                        InkWell(
                          onTap: () {
                            if(cubit.paymentMethod != PaymentMethods.cash && cubit.paymentOptions.firstWhereOrNull((e)=>e.selected) == null){
                              Get.snackbar("error".tr, "please_choose_payment_method".tr);
                            }else{
                              cubit.checkout();
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: RahtkColors.tealColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text(
                              "checkout".tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class FakeSubject implements IAddAble<AddressEntity> {
  final ChoosePaymentOptionCubit cubit;

  FakeSubject(this.cubit);

  @override
  void onAdd(AddressEntity address) {
    cubit.updateAddress(address);
  }
}
