import 'package:common/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/order/payment/add_payment/business_logic/add_payment_option_cubit.dart';
import 'package:rahtk_mobile/features/order/payment/add_payment/presentation/widgets/payment_card.dart';

class AddPaymentPage extends StatelessWidget {
  AddPaymentPage({super.key});

  final _formStateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddPaymentOptionCubit, AddPaymentOptionState>(
      listener: (context, state) {
        if (state is AddPaymentOptionResult) {
          Navigator.pop(context);
          Get.snackbar(
            state.success ? "success".tr : "error".tr,
            state.message.tr,
          );
        }
      },
      builder: (context, state) {
        AddPaymentOptionCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor: RahtkColors.aliceBlue,
          resizeToAvoidBottomInset: false,
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Column(
              children: [
                RahtkNavigationBar(
                  title: "add_card".tr,
                ),
                const SizedBox(
                  height: 5,
                ),
                AddPaymentCard(
                  paymentOptionEntity: cubit.paymentEntity,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: SingleChildScrollView(
                              child: Form(
                                key: _formStateKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      maxLength: 16,
                                      decoration: inputDecoration(
                                        "card_number".tr,
                                      ),
                                      onChanged: (value) {
                                        cubit.paymentEntity.value.cardNumber
                                            .value = value;
                                      },
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      maxLength: 25,
                                      decoration: inputDecoration("name".tr),
                                      onChanged: (value) {
                                        cubit.paymentEntity.value.holderName
                                            .value = value;
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: Get.width * 0.6 - 20,
                                          child: TextFormField(
                                            keyboardType: TextInputType.datetime,
                                            maxLength: 5,
                                            decoration:
                                                inputDecoration("exp_date".tr),
                                            onChanged: (value) {
                                              cubit.paymentEntity.value.expiryDate
                                                  .value = value;
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width * 0.3 - 10,
                                          child: TextFormField(
                                            keyboardType: TextInputType.number,
                                            obscureText: true,
                                            maxLength: 3,
                                            decoration: inputDecoration("cvv".tr),
                                            onChanged: (value) {
                                              cubit.paymentEntity.value.cvv
                                                  .value = value;
                                            },
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          RahtkLoadingButton(
                            loadingState: cubit.loadingState,
                            child: InkWell(
                              onTap: () {
                                Logger.D("message");
                                if (_formStateKey.currentState?.validate() ==
                                    true) {
                                  cubit.submit();
                                }
                              },
                              child: Container(
                                width: Get.width - 40,
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    50,
                                  ),
                                  color: RahtkColors.tealColor,
                                ),
                                child: Text(
                                  "add_card".tr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  InputBorder border() {
    return const UnderlineInputBorder(
      borderSide: BorderSide(
        color: RahtkColors.lightGrayish,
      ),
    );
  }

  InputDecoration inputDecoration(String hintText) {
    return InputDecoration(
      labelText: hintText,
      hintText: hintText,
      hintStyle: const TextStyle(
        color: RahtkColors.darkGray,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      labelStyle: const TextStyle(
        color: RahtkColors.darkGray,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      border: border(),
      disabledBorder: border(),
      enabledBorder: border(),
      focusedBorder: border(),
    );
  }
}
