import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/browse/business_logic/browse_cubit.dart';
import 'package:get/get.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseCubit(),
      child: BlocConsumer<BrowseCubit, BrowseState>(
        listener: (context, state) {

        },
        builder: (context, state) {
          return SizedBox(
            width: Get.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 170,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: RahtkColors.tealColor,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).padding.top,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "browse".tr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/images/favorite_ic.svg",
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SvgPicture.asset(
                                "assets/images/cart_ic.svg",
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Container(
                            height: 45,
                            width: Get.width - 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                color: RahtkColors.tealColor,
                                width: 1,
                              ),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.search,
                                  color: RahtkColors.tealColor,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "search_product".tr,
                                  style: TextStyle(
                                    color: RahtkColors.darkGray.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
