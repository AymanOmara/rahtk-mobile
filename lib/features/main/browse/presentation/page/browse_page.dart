import 'package:di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rahtk_mobile/core/helper/constants.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/bar_icons/presentation/bar_icons_widget.dart';
import 'package:rahtk_mobile/features/main/browse/business_logic/browse_cubit.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/features/main/home/presentation/widgets/product_widget.dart';

class BrowsePage extends StatelessWidget {
  const BrowsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BrowseCubit(diInjector()),
      child: BlocConsumer<BrowseCubit, BrowseState>(
        listener: (context, state) {},
        builder: (context, state) {
          BrowseCubit cubit = BlocProvider.of(context);
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SizedBox(
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
                            const BarIconsWidget(
                              isNotificationVisible: false,
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
                              child: TextFormField(
                                onChanged: (value) {
                                  cubit.searchProducts(value);
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: const Icon(
                                    Icons.search,
                                    color: RahtkColors.tealColor,
                                  ),
                                  hintText: "search_product".tr,
                                  hintStyle: const TextStyle(
                                    color: RahtkColors.darkGray,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: LoadingWidget(
                      loadingState: cubit.loadingState,
                      successWidget: SingleChildScrollView(
                        child: Wrap(
                          children: cubit.filteredProducts
                              .map((e) => ProductWidget(product: e))
                              .toList(),
                        ),
                      ),
                      onRetry: () {
                        cubit.fetchProducts();
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
