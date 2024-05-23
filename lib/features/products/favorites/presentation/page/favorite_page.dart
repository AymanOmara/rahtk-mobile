import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/home/presentation/widgets/product_widget.dart';
import 'package:rahtk_mobile/features/products/favorites/business_logic/favorites_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        FavoritesCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: Column(
            children: [
              Container(
                height: 140,
                width: Get.width,
                decoration: const BoxDecoration(
                  color: RahtkColors.tealColor,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                icon: SvgPicture.asset(
                                  "assets/images/back_ic.svg",
                                  width: 24,
                                  height: 24,
                                  colorFilter: const ColorFilter.mode(
                                    Colors.white,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "wishlist".tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              LoadingWidget(
                loadingState: cubit.loading,
                successWidget: Wrap(
                  children: cubit.products
                      .map((e) => ProductWidget(product: e))
                      .toList(),
                ),
                onRetry: () {
                  cubit.fetchFavorites();
                },
              )
            ],
          ),
        );
      },
    );
  }
}