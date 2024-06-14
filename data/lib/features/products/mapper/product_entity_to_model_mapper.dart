import 'package:data/features/products/model/product_model.dart';
import 'package:domain/features/product/entity/product_entity.dart';

extension ProductEntityToModelMapper on ProductEntity {
  ProductModel get toModel => ProductModel()
    ..id = id
    ..arabicName = arabicName
    ..englishName = englishName
    ..arabicDescription = arabicDescription
    ..englishDescription = englishDescription
    ..price = price
    ..discount = discountPercentage
    ..imagePath = image
    ..createdDate = createdAt
    ..categoryId = categoryId
    ..isFavorite = isFavorite
    ..priceType = priceType
    ..condition = condition
    ..categoryNameEn = categoryNameEn
    ..categoryNameAr = categoryNameAr
    ..location = location
    ..deliveryDetails = deliveryDetails
    ..purchaseCount = purchaseCount;
}
