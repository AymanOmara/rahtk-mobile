import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/theme/colors.dart';
import 'package:rahtk_mobile/features/main/home/business_logic/home_cubit.dart';
import 'package:rahtk_mobile/features/main/home/presentation/widgets/category_widget.dart';
import 'package:rahtk_mobile/features/main/home/presentation/widgets/new_arrival_products.dart';
import 'package:rahtk_mobile/features/main/home/presentation/widgets/product_widget.dart';
import 'package:rahtk_mobile/features/main/home/presentation/widgets/top_navigation_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit cubit = BlocProvider.of(context);
        return SizedBox(
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const TopNavigationBar(),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: LoadingWidget(
                  loadingState: cubit.loadingState,
                  successWidget: SingleChildScrollView(
                    child: Column(
                      children: [
                        Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            ...cubit.categories
                                .map((e) => CategoryWidget(category: e)),
                          ],
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        const NewArrivalProducts(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "popular_products".tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                width: 100,
                                decoration: BoxDecoration(
                                  color: RahtkColors.tealColor,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Text(
                                  "see_all".tr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: cubit.popularProducts.take(3)
                                .map((e) => ProductWidget(product: e))
                                .toList(),
                          ),
                        )
                      ],
                    ),
                  ),
                  onRetry: () {
                    cubit.fetchCategories();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
