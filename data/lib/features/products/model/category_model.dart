import 'package:data/features/products/model/product_model.dart';
import 'package:data/network/decode_able.dart';

class CategoryModel implements DecodeAble<List<CategoryModel>, List?> {
  int? id;
  String? imagePath;
  String? arabicName;
  String? englishName;
  List<ProductModel>? products;

  @override
  fromJson(json) {
    return json
            ?.map<CategoryModel>((e) => CategoryModel()
              ..id = e['id']
              ..imagePath = e['imagePath']
              ..arabicName = e['arabicName']
              ..englishName = e['englishName']
              ..products = ProductsModel().fromJson(e['products']))
            .toList() ??
        [];
  }
}
