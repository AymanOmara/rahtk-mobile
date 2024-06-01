import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';

class PharmacyCategory extends StatelessWidget {
  const PharmacyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRoutes.allDrugsPage,
        );
      },
      child: SizedBox(
        width: Get.width / 3 - 10,
        height: Get.width / 3 - 10,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/pharmacy_ic.jpeg",
              width: Get.width / 3 - 10,
              height: Get.width / 3 - 10,
              fit: BoxFit.fill,
            ),
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            Text(
              "pharmacy".tr,
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
