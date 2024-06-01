import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/use_case/get_favorites_use_case.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit(
    this._getFavoritesUseCase,
  ) : super(FavoritesInitial()) {
    fetchFavorites();
  }

  final GetFavoritesUseCase _getFavoritesUseCase;
  LoadingState loading = Loading();
  List<ProductDisplay> products = [];

  void fetchFavorites() {
    products.clear();
    loading = Loading();
    emit(FavoritesLoading());
    _getFavoritesUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          loading = LoadingSuccess(data: data);
          products = data.toDisplayList();
          emit(FavoritesResult());
          break;
        case Failure(exception: final exception):
          loading = LoadingException(exception);
          emit(FavoritesResult());
          break;
      }
    });
  }

  void addFavorite(ProductDisplay product) {
    products.add(product);
    loading = LoadingSuccess(data: products);
    emit(FavoritesUpdateFavoriteList(favorites: products));
  }

  void removeFavorite(ProductDisplay product) {
    var productToRemove =
        products.firstWhereOrNull((prod) => prod.id == product.id);
    if (productToRemove != null) {
      products.remove(productToRemove);
    }
    loading = LoadingSuccess(data: products);
    emit(FavoritesUpdateFavoriteList(favorites: products));
  }
}
