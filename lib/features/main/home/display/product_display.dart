import 'package:domain/features/product/entity/product_entity.dart';
import 'package:get/get.dart';

class ProductDisplay {
  final int id;
  final int categoryId;
  final String arabicName;
  final String englishName;
  final String arabicDescription;
  final String englishDescription;
  final double price;
  final double discountPercentage;
  final String image;
  final String createdAt;
  final String condition;
  bool isFavorite;
  bool selected = false;
  final String priceType;
  final String categoryNameAr;
  final String categoryNameEn;
  final String location;
  final String deliveryDetails;
  final int purchaseCount;

  ProductDisplay({
    required this.id,
    required this.arabicName,
    required this.englishName,
    required this.arabicDescription,
    required this.englishDescription,
    required this.price,
    required this.discountPercentage,
    required this.image,
    required this.createdAt,
    required this.categoryId,
    required this.isFavorite,
    required this.condition,
    required this.location,
    required this.priceType,
    required this.categoryNameEn,
    required this.categoryNameAr,
    required this.deliveryDetails,
    required this.purchaseCount,
  });

  String get localizedName =>
      Get.locale?.languageCode == "ar" ? arabicName : englishName;

  String get localizedDescription =>
      Get.locale?.languageCode == "ar" ? arabicDescription : englishDescription;

  String get localizedCategoryName =>
      Get.locale?.languageCode == "ar" ? categoryNameAr : categoryNameEn;

  String discountPrice() {
    var amount = (price - (price * (discountPercentage / 100))).toString();
    return amount == price.toString() ? "" : amount;
  }
}

extension ProductDisplayMapper on ProductEntity {
  ProductDisplay toDisplay() {
    return ProductDisplay(
      id: id,
      arabicName: arabicName,
      englishName: englishName,
      arabicDescription: arabicDescription,
      englishDescription: englishDescription,
      price: price,
      discountPercentage: discountPercentage,
      image: image,
      createdAt: createdAt,
      categoryId: categoryId,
      isFavorite: isFavorite,
      condition: condition,
      categoryNameAr: categoryNameAr,
      categoryNameEn: categoryNameEn,
      location: location,
      priceType: priceType,
      deliveryDetails: deliveryDetails,
      purchaseCount: purchaseCount,
    );
  }
}

extension ProductDisplayListMapper on List<ProductEntity> {
  List<ProductDisplay> toDisplayList() {
    return map((e) => e.toDisplay()).toList();
  }
}
