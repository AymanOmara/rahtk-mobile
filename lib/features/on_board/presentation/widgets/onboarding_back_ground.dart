import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';

class OnBoardingBackGround extends StatelessWidget {
  const OnBoardingBackGround({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.5,
      width: Get.width,
      color: RahtkColors.tealColor,
    );
  }
}
