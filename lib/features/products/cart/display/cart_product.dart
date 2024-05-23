import 'package:rahtk_mobile/features/main/home/display/product_display.dart';

class CartProductDisplay {
  final ProductDisplay product;
  int productCount = 1;

  CartProductDisplay({
    required this.product,
  });
  double getFullPrice() {
    double discountedPrice = product.price - (product.price * (product.discountPercentage / 100));
    return discountedPrice * productCount;
  }
}
