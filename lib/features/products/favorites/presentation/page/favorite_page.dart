import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/core/ui/rahtk_navigation_bar.dart';
import 'package:rahtk_mobile/features/main/bar_icons/business_logic/bar_icons_cubit.dart';
import 'package:rahtk_mobile/features/main/home/presentation/widgets/product_widget.dart';
import 'package:rahtk_mobile/features/products/favorites/business_logic/favorites_cubit.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesState>(
      listener: (context, state) {
        if(state is FavoritesResult || state is FavoritesUpdateFavoriteList){
          FavoritesCubit favoritesCubit = BlocProvider.of(context);
          BarIconsCubit barIconsCubit = BlocProvider.of(context);
          barIconsCubit.updateFavorites(favoritesCubit.products);
        }
      },
      builder: (context, state) {
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
      },
    );
  }
}
