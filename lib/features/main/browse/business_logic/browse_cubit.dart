import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/product/use_case/get_all_products_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';

part 'browse_state.dart';

class BrowseCubit extends Cubit<BrowseState> {
  BrowseCubit(
    this._getAllProductsUseCase,
  ) : super(BrowseInitial()){
    fetchProducts();
  }
  final GetAllProductsUseCase _getAllProductsUseCase;
  LoadingState loadingState = Loading();
  List<ProductDisplay> filteredProducts = [];
  List<ProductDisplay> allProducts = [];

  void fetchProducts() {
    loadingState = Loading();
    emit(BrowseLoading());
    _getAllProductsUseCase().then((value) {
      switch (value) {
        case Success(data: final data):
          filteredProducts = data.map((e) => e.toDisplay()).toList();
          allProducts = data.map((e) => e.toDisplay()).toList();
          loadingState = LoadingSuccess(data: data);
          emit(BrowseResult());
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(BrowseResult());
          break;
      }
    });
  }
  void searchProducts(String txt){
    if(txt.isEmpty){
      filteredProducts = allProducts;
    }else{
      filteredProducts = allProducts.where((element) => element.localizedName.toLowerCase().contains(txt.toLowerCase())).toList();
    }
    emit(BrowseResult());
  }
}
