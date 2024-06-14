import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:rahtk_mobile/core/ui/loading/loading_widget.dart';
import 'package:rahtk_mobile/features/main/home/business_logic/home_cubit.dart';
import 'package:rahtk_mobile/features/products/favorites/business_logic/favorites_cubit.dart';
import 'package:rahtk_mobile/features/products/product_details/business_logic/product_details_cubit.dart';
import 'package:rahtk_mobile/features/products/product_details/presentation/widgets/product_details_top_widget.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
      listener: (context, state) {
        if (state is ProductDetailsResult) {
          FavoritesCubit favoritesCubit = BlocProvider.of(context);
          if (state.success) {
            Get.snackbar(
              "success".tr,
              state.message,
              snackPosition: SnackPosition.BOTTOM,
            );
            if (state.productDisplay!.isFavorite) {
              favoritesCubit.addFavorite(state.productDisplay!);
            } else {
              favoritesCubit.removeFavorite(state.productDisplay!);
            }
          } else {
            Get.snackbar(
              "error".tr,
              state.message.tr,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        }
        if(state is ProductDetailsReminderResult){
          Get.snackbar(
            state.success ? "success".tr : "error".tr,
            state.message,
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      },
      builder: (context, state) {
        ProductDetailsCubit cubit = BlocProvider.of(context);
        return Scaffold(
          body: LoadingWidget(
            loadingState: cubit.loadingState,
            successWidget: Column(
              children: [
                Expanded(
                  child: ProductDetailsTopWidget(
                    product: cubit.product,
                  ),
                ),
              ],
            ),
            onRetry: () {
              cubit.fetchProductDetails();
            },
          ),
        );
      },
    );
  }
}
