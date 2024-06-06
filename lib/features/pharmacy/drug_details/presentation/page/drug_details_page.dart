import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/bar_icons/business_logic/bar_icons_cubit.dart';
import 'package:rahtk_mobile/features/order/cart/business_logic/cart_cubit.dart';
import 'package:rahtk_mobile/features/order/cart/display/cart_drug_display.dart';
import 'package:rahtk_mobile/features/pharmacy/drug_details/business_logic/drug_details_cubit.dart';

class DrugDetailsPage extends StatelessWidget {
  const DrugDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DrugDetailsCubit, DrugDetailsState>(
      listener: (context, state) {
        if (state is DrugDetailsResult) {
          Get.snackbar(
            state.success ? "success".tr : "error".tr,
            state.message,
          );
        }
      },
      builder: (context, state) {
        DrugDetailsCubit cubit = BlocProvider.of(context);
        return GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            backgroundColor: RahtkColors.aliceBlue,
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                RahtkNavigationBar(
                  title: cubit.drugEntity.name,
                  height: 120,
                ),
                Stack(
                  children: [
                    Opacity(
                      opacity: 1,
                      child: CachedNetworkImage(
                        imageUrl: "${Common.baseUrl}${cubit.drugEntity.image}",
                        width: Get.width,
                        height: 220,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => const Stack(
                          alignment: Alignment.center,
                          children: [
                            CircularProgressIndicator(),
                          ],
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(
                                  0.4,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                "assets/images/back_ic.svg",
                                width: 24,
                                height: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverFillRemaining(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      cubit.drugEntity.discountPrice().isNotEmpty == true ? cubit.drugEntity.discountPrice().toString() : cubit.drugEntity.price.toString(),
                                      softWrap: true,
                                      style: const TextStyle(
                                        color: RahtkColors.tealColor,
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      cubit.drugEntity.discountPrice().isNotEmpty == true ? cubit.drugEntity.price.toString() : "",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      cubit.drugEntity.discountPercentage == 0
                                          ? ""
                                          : "${cubit.drugEntity.discountPercentage.toString()}%  ${"off".tr}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: RahtkColors.darkGray,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  "add_periodically_reminder_note".tr,
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                TextFormField(
                                  onChanged: (txt) {
                                    cubit.duration = txt;
                                  },
                                  keyboardType: TextInputType.number,
                                  decoration:
                                      inputDecoration("period_in_days".tr),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    Get.snackbar("success".tr, "product_added_to_cart".tr);
                    CartCubit cartCubit =  BlocProvider.of<CartCubit>(context);
                    cartCubit.addToCartDrug(CartDrugDisplay(drug: cubit.drugEntity));
                    BlocProvider.of<BarIconsCubit>(context).updateCartProducts(cartCubit.products.map((e)=> e.product).toList());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding:const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: RahtkColors.tealColor,
                        borderRadius: BorderRadius.circular(20)
                    ),
                    // color: RahtkColors.tealColor,
                    width: Get.width-20,
                    child: Text(
                      "add_to_cart".tr,
                      style:const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                RahtkLoadingButton(
                  loadingState: cubit.loadingState,
                  child: InkWell(
                    onTap: () {
                      cubit.submit();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: Get.width - 20,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: RahtkColors.tealColor,
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      child: Text(
                        "save".tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
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
