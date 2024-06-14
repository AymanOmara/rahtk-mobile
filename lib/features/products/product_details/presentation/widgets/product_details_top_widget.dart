import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_btn.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/bar_icons/business_logic/bar_icons_cubit.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';
import 'package:rahtk_mobile/features/order/cart/business_logic/cart_cubit.dart';
import 'package:rahtk_mobile/features/products/product_details/business_logic/product_details_cubit.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetailsTopWidget extends StatelessWidget {
  const ProductDetailsTopWidget({
    super.key,
    required this.product,
  });

  final ProductDisplay? product;

  @override
  Widget build(BuildContext context) {
    ProductDetailsCubit cubit = context.watch();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          color: RahtkColors.tealColor,
          height: MediaQuery.of(context).padding.top,
          width: Get.width,
        ),
        Stack(
          children: [
            Opacity(
              opacity: 1,
              child: CachedNetworkImage(
                imageUrl: "${Common.baseUrl}${product?.image}",
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (product?.isFavorite == true) {
                            cubit.removeFavorite();
                          } else if (product?.isFavorite == false) {
                            cubit.addFavorite();
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: product?.isFavorite == true
                              ? Colors.red
                              : Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Share.share(
                              "${"share_product_note".tr} ${product?.localizedName} ${Common.baseUrl}${product?.image}");
                        },
                        child: SvgPicture.asset(
                          "assets/images/share_ic.svg",
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Expanded(
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Text(
                              product?.localizedName ?? "",
                              style: const TextStyle(
                                color: RahtkColors.darkGray,
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextFormField(
                              onChanged: (txt) {
                                cubit.duration = int.tryParse(txt) ?? 0;
                              },
                              keyboardType: TextInputType.number,
                              decoration: inputDecoration(
                                "period_in_days".tr,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "${product?.discountPrice().isNotEmpty == true ? product?.discountPrice().toString() : product?.price.toString()}",
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
                                  "${product?.discountPrice().isNotEmpty == true ? product?.price.toString() : ""}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  product?.discountPercentage == 0
                                      ? ""
                                      : "${product?.discountPercentage.toString()}%  ${"off".tr}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: RahtkColors.darkGray,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              product?.localizedDescription ?? "",
                              style: TextStyle(
                                color: RahtkColors.darkGray.withOpacity(0.7),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Text(
                                  "condition".tr,
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.2,
                                ),
                                Text(
                                  product?.condition ?? "--",
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "price_type".tr,
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.2,
                                ),
                                Text(
                                  product?.priceType ?? "--",
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "category".tr,
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.2,
                                ),
                                Text(
                                  product?.localizedCategoryName ?? "--",
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "location".tr,
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.2,
                                ),
                                Text(
                                  product?.location ?? "--",
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "additional_details".tr,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  "delivery_details".tr,
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * 0.2,
                                ),
                                Text(
                                  product?.deliveryDetails ?? "--",
                                  style: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    RahtkLoadingButton(
                      loadingState: cubit.addReminderLoading,
                      child: InkWell(
                        onTap: () {
                          cubit.addToReminder();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: Get.width - 50,
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
                    InkWell(
                      onTap: () {
                        if (product != null) {
                          Get.snackbar(
                              "success".tr, "product_added_to_cart".tr);
                          CartCubit cartCubit =
                              BlocProvider.of<CartCubit>(context);
                          cartCubit.addToCart(product!);
                          BlocProvider.of<BarIconsCubit>(context)
                              .updateCartProducts(cartCubit.products
                                  .map((e) => e.product)
                                  .toList());
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: RahtkColors.tealColor,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        width: Get.width - 50,
                        child: Text(
                          "add_to_cart".tr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom + 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
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
