import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/order/cart/business_logic/cart_cubit.dart';
import 'package:rahtk_mobile/features/order/cart/display/cart_product.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({
    super.key,
    required this.product,
  });

  final CartProductDisplay product;

  @override
  Widget build(BuildContext context) {
    CartCubit cubit = context.watch();
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 29,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 102,
                height: 102,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: CachedNetworkImage(
                  imageUrl: "${Common.baseUrl}${product.product.image}",
                  width: 160,
                  height: 127,
                  fit: BoxFit.fill,
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
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.product.localizedName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: RahtkColors.darkGray,
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product.product.discountPrice().isNotEmpty == true
                                ? product.product.discountPrice().toString()
                                : product.product.price.toString(),
                            softWrap: true,
                            style: const TextStyle(
                              color: RahtkColors.tealColor,
                              fontWeight: FontWeight.w800,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          product.product.discountPrice().isNotEmpty == true
                              ? product.product.price.toString()
                              : "",
                          style: const TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          product.product.discountPercentage == 0
                              ? ""
                              : "${product.product.discountPercentage.toString()}%  ${"off".tr}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: RahtkColors.darkGray,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("${"quantity".tr}:${product.productCount}"),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                cubit.incrementCount(product);
                              },
                              child:const Icon(
                                Icons.arrow_drop_up,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: (){
                              cubit.decrementCount(product);
                              },
                              child: const Icon(
                                Icons.arrow_drop_down_sharp,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 29,
          ),
        ],
      ),
    );
  }
}
