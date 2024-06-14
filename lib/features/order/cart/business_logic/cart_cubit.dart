import 'package:bloc/bloc.dart';
import 'package:domain/common/result.dart';
import 'package:domain/features/order/entity/address_entity.dart';
import 'package:domain/features/order/use_case/get_address_use_case.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/core/display/i_add_able.dart';
import 'package:rahtk_mobile/core/display/loading_states.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';
import 'package:rahtk_mobile/features/order/cart/display/cart_product.dart';
import 'package:get/get.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> implements IAddAble<AddressEntity> {
  CartCubit(
      this._getAddressUseCase,
      ) : super(CartInitial()){
    fetchAddresses();
  }

  final GetAddressUseCase _getAddressUseCase;
  List<CartProductDisplay> products = [];
  AddressEntity? address;
  LoadingState loadingState = Loading(showSuccessWidget: true);

  void addToCart(ProductDisplay product) {
    var productToAdd =
    products.firstWhereOrNull((prod) => prod.product.id == product.id);
    if (productToAdd != null) {
      productToAdd.productCount += 1;
      emit(CartAdd());
      return;
    }
    products.add(CartProductDisplay(product: product));
    emit(CartAdd());
  }

  void removeFromCart(CartProductDisplay product) {
    products.remove(product);
    emit(CartRemove());
  }

  void incrementCount(CartProductDisplay product) {
    product.productCount += 1;
    emit(CartIncrement());
  }

  void decrementCount(CartProductDisplay product) {
    if (product.productCount > 1) {
      product.productCount -= 1;
      emit(CartDecrement());
    } else {
      removeFromCart(product);
    }
  }


  @override
  void onAdd(AddressEntity item) {
    address = item;
    emit(CartAddressAdded());
  }

  void clearCartProduct(){
    products.clear();
    emit(CartProductCleared());
  }

  void fetchAddresses() {
    loadingState = Loading(showSuccessWidget: true);
    emit(CartLoading());
    _getAddressUseCase().then((value){
      switch (value) {
        case Success(data: final data):
          loadingState = LoadingSuccess(data: "data");
          if(data.isNotEmpty){
            address = data.first;
          }
          emit(CartLoading());
          break;
        case Failure(exception: final exception):
          loadingState = LoadingException(exception);
          emit(CartLoading());
          break;
      }
    });
  }
}
