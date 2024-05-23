import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';
import 'package:rahtk_mobile/features/products/cart/display/cart_product.dart';
import 'package:get/get.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<CartProductDisplay> products = [];

  void addToCart(ProductDisplay product) {
    var productToAdd = products.firstWhereOrNull((prod) => prod.product.id == product.id);
    if (productToAdd != null) {
      productToAdd.productCount += 1;
      emit(CartAdd());
      return;
    }
    products.add(CartProductDisplay(product: product));
    emit(CartAdd());
  }
}
