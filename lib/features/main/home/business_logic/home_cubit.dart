import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/use_case/get_categories_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/features/main/home/display/category_display.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getCategoriesUseCase) : super(HomeInitial()) {
    fetchCategories();
  }

  final GetCategoriesUseCase _getCategoriesUseCase;
  LoadingState loadingState = Loading();
  List<CategoryDisplay> categories = [];
  List<ProductDisplay> products = [];
  List<ProductDisplay> popularProducts = [];

  void fetchCategories() {
    loadingState = Loading();
    emit(HomeLoading());
    _getCategoriesUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          categories = data.map((e) => e.toDisplay()).toList();
          loadingState = LoadingSuccess(data: categories);
          if(categories.isNotEmpty){
            products = categories.map((e)=>e.products).reduce((value, element) => value + element).toList();
          }
          popularProducts = products;
          popularProducts.sort((a,b)=>b.purchaseCount.compareTo(a.purchaseCount));
          emit(HomeResult());
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(HomeResult());
          break;
      }
    });
  }
  void addToFavorites(int id) {
    products.firstWhere((element) => element.id == id).isFavorite = true;
    emit(HomeResult());
  }
  void removeFromFavorites(int id) {
    products.firstWhere((element) => element.id == id).isFavorite = false;
    emit(HomeResult());
  }
}
