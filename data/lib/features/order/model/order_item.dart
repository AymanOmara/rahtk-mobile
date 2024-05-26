import 'package:data/features/products/model/product_model.dart';
import 'package:data/network/decode_able.dart';

class OrderItem implements DecodeAble<List<OrderItem>, List?> {
  ProductModel? product;
  int? quantity;

  OrderItem({
    this.product,
    this.quantity,
  });

  @override
  List<OrderItem> fromJson(json) {
    return json
            ?.map<OrderItem>(
              (e) => OrderItem()
                ..quantity = e['productCounter']
                ..product = ProductModel().fromJson(e['product']),
            )
            .toList() ??
        [];
  }
}
