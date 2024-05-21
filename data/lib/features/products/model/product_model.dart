import 'package:data/network/decode_able.dart';

class ProductModel implements DecodeAble<List<ProductModel>, List?> {
  int? id;
  String? arabicName;
  String? englishName;
  String? arabicDescription;
  String? englishDescription;
  double? price;
  double? discount;
  String? imagePath;
  String? createdDate;
  int? categoryId;

  @override
  List<ProductModel> fromJson(List? json) {
    return json
            ?.map<ProductModel>((e) => ProductModel()
              ..id = e['id']
              ..imagePath = e['imagePath']
              ..arabicDescription = e['arabicDescription']
              ..englishDescription = e['englishDescription']
              ..price = e['price']
              ..discount = e['discountPercentage']
              ..arabicName = e['arabicName']
              ..createdDate = e['createdDate']
              ..englishName = e['englishName']
              ..categoryId = e['categoryId'])
            .toList() ??
        [];
  }
}
