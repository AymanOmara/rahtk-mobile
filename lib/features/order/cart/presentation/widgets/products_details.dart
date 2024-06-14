import 'package:flutter/material.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/order/cart/display/cart_product.dart';
import 'package:get/get.dart';

class ProductsDetails extends StatelessWidget {
  const ProductsDetails({
    super.key,
    required this.products,
    this.horizontalPadding = 20
  });

  final List<CartProductDisplay> products;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    int totalItemCount = products.fold(0, (sum, item) => sum + item.productCount);
    double totalPrice = products.fold(0.0, (sum, item) => sum + item.getFullPrice());

    return Visibility(
      visible: products.isNotEmpty,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: horizontalPadding),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "price_details".tr,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${"price".tr} (${totalItemCount > 0 ? "$totalItemCount ${"item".tr}" : ""})",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        totalItemCount > 0 ? totalPrice.toStringAsFixed(2) : "",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            Container(
              color: RahtkColors.aliceBlue,
              height: 2,
              width: Get.width,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "total_amount".tr,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    totalItemCount > 0 ? totalPrice.toStringAsFixed(2) : "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
