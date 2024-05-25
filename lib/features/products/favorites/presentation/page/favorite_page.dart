import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
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
              RahtkNavigationBar(
                title: "wishlist".tr,
              ),
              const SizedBox(
                height: 20,
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
