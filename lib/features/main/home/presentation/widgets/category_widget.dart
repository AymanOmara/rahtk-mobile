import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/features/main/home/display/category_display.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
    required this.category,
  });

  final CategoryDisplay category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.categoryProducts,
          arguments: category,
        );
      },
      child: SizedBox(
        width: Get.width / 3 - 10,
        height: Get.width / 3 - 10,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: "${Common.baseUrl}${category.imagePath}",
              width: Get.width / 3 - 10,
              height: Get.width / 3 - 10,
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
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            Text(
              category.localizedName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
