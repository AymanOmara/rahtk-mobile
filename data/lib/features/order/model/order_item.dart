import 'package:data/features/products/model/product_model.dart';

class OrderItem {
  ProductModel? product;
  int? quantity;

  OrderItem({
    this.product,
    this.quantity,
  });
}
