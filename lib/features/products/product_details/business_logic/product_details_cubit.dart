import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/use_case/add_to_favorite_use_case.dart';
import 'package:domain/features/product/use_case/get_product_details_use_case.dart';
import 'package:domain/features/product/use_case/remove_from_favorite_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit(
    this.productId,
    this._addToFavoriteUseCase,
    this._removeFavoriteUseCase,
    this._getProductDetailsUseCase,
  ) : super(ProductDetailsInitial()) {
    fetchProductDetails();
  }

  final int productId;
  ProductDisplay? product;
  final AddToFavoriteUseCase _addToFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final GetProductDetailsUseCase _getProductDetailsUseCase;
  LoadingState loadingState = Loading();

  void addFavorite() {
    loadingState = Loading(showSuccessWidget: true);
    emit(ProductDetailsLoading());
    _addToFavoriteUseCase(productId).then((value) {
      switch (value) {
        case Success(data: final data):
          if (data.success) {
            product?.isFavorite = true;
          }
          loadingState = LoadingSuccess(data: "data");
          emit(
            ProductDetailsResult(
              success: data.statusCode == 200,
              message: data.message,
              productDisplay: product,
            ),
          );
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(
            ProductDetailsResult(
              success: false,
              message: exception.message,
            ),
          );
          break;
      }
    });
  }

  void removeFavorite() {
    loadingState = Loading(showSuccessWidget: true);
    emit(ProductDetailsLoading());
    _removeFavoriteUseCase(productId).then((value) {
      switch (value) {
        case Success(data: final data):
          if (data.success) {
            product?.isFavorite = false;
          }
          loadingState = LoadingSuccess(data: "data");
          emit(
            ProductDetailsResult(
              success: data.statusCode == 200,
              message: data.message,
              productDisplay: product,
            ),
          );
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(
            ProductDetailsResult(
              success: false,
              message: exception.message,
            ),
          );
          break;
      }
    });
  }

  void fetchProductDetails() {
    loadingState = Loading();
    emit(ProductDetailsLoading());
    _getProductDetailsUseCase(productId).then((value) {
      switch (value) {
        case Success(data: final data):
          product = data.data?.toDisplay();
          loadingState = LoadingSuccess(data: data);
          emit(ProductDetailsLoading());
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(ProductDetailsLoading());
          break;
      }
    });
  }
}
