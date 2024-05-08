import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/on_board/business_logic/on_boarding_cubit.dart';

import 'dotted_widget.dart';

class OnBoardingCarouselSlider extends StatelessWidget {
  const OnBoardingCarouselSlider({
    super.key,
    required this.pageViewController,
  });

  final PageController pageViewController;

  @override
  Widget build(BuildContext context) {
    OnBoardingCubit cubit = context.watch<OnBoardingCubit>();
    return SizedBox(
      height: Get.height * 0.5,
      child: PageView(
        controller: pageViewController,
        onPageChanged: (pageIndex) => cubit.changeIndex(pageIndex),
        children: cubit.onBoardingSliders.asMap().entries.map((entry) {
          return SizedBox(
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                SvgPicture.asset(
                  "assets/images/onboarding_${entry.key + 1}.svg",
                  width: Get.width - 20,
                  height: Get.height * 0.3,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  entry.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: RahtkColors.tealColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                DottedWidget(
                  totalSlides: cubit.onBoardingSliders.length,
                  currentIndex: cubit.currentIndex,
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
