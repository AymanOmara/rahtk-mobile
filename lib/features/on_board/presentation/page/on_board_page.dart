import 'package:common/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';

import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/on_board/business_logic/on_boarding_cubit.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/features/on_board/presentation/widgets/carousel_slider.dart';

class OnBoardPage extends StatelessWidget {
  OnBoardPage({super.key});

  final PageController pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      builder: (context, state) {
        OnBoardingCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              Stack(
                children: [
                  Container(
                    height: Get.height * 0.5,
                    width: Get.width,
                    color: RahtkColors.tealColor,
                  ),
                  Positioned(
                    top: Get.height * 0.3,
                    left: 20,
                    right: 20,
                    child: Align(
                      child: Container(
                        padding: const EdgeInsets.only(
                          top: 20,
                          left: 14,
                          right: 14,
                          bottom: 32,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: OnBoardingCarouselSlider(
                          pageViewController: pageViewController,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: MediaQuery.of(context).padding.bottom + 20,
                left: 10,
                right: 10,
                child: MaterialButton(
                  color: RahtkColors.tealColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  onPressed: () async {
                    if (cubit.currentIndex <
                        cubit.onBoardingSliders.length - 1) {
                      Logger.D(cubit.currentIndex);
                      pageViewController.nextPage(
                        duration: const Duration(
                          milliseconds: 500,
                        ),
                        curve: Curves.linear,
                      );
                    } else {
                      cubit.updateFirstLaunch();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        AppRoutes.login,
                        (route) => false,
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      cubit.currentIndex >= cubit.onBoardingSliders.length - 1
                          ? "Get Started"
                          : "Next",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
