import 'package:data/network/decode_able.dart';
import 'package:data/network/encode_able.dart';

class ProductsModel implements DecodeAble<List<ProductModel>, List?> {
  @override
  List<ProductModel> fromJson(List? json) {
    return json
            ?.map<ProductModel>((e) => ProductModel().fromJson(e))
            .toList() ??
        [];
  }
}

class ProductModel implements DecodeAble<ProductModel, Map?>,EncodeAble {
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
  bool? isFavorite;
  String? priceType;
  String? condition;
  String? categoryNameEn;
  String? categoryNameAr;
  String? location;
  String? deliveryDetails;
  int? purchaseCount;
  @override
  ProductModel fromJson(Map? json) {
    return ProductModel()
      ..id = json?['id']
      ..imagePath = json?['imagePath']
      ..arabicDescription = json?['arabicDescription']
      ..englishDescription = json?['englishDescription']
      ..price = json?['price']
      ..discount = json?['discountPercentage']
      ..arabicName = json?['arabicName']
      ..createdDate = json?['createdDate']
      ..englishName = json?['englishName']
      ..isFavorite = json?['isFavorite']
      ..priceType = json?['priceType']
      ..categoryNameEn = json?['categoryNameEn']
      ..categoryNameAr = json?['categoryNameAr']
      ..condition = json?['condition']
      ..location = json?['location']
      ..deliveryDetails = json?['deliveryDetails']
      ..purchaseCount = json?['purchasementCount']
      ..categoryId = json?['categoryId'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imagePath': imagePath,
      'arabicDescription': arabicDescription,
      'englishDescription': englishDescription,
      'price': price,
      'discountPercentage': discount,
      'arabicName': arabicName,
      'createdDate': createdDate,
      'englishName': englishName,
      'isFavorite': isFavorite,
      'priceType': priceType,
      'categoryNameEn': categoryNameEn,
      'categoryNameAr': categoryNameAr,
      'condition': condition,
      'location': location,
      'deliveryDetails': deliveryDetails,
      'purchasementCount': purchaseCount,
      'categoryId': categoryId
    };
  }
}
