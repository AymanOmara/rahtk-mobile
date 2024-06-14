import 'package:domain/features/product/entity/product_entity.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';

extension ProductDisplayMapper on ProductDisplay {
  ProductEntity get toEntity => ProductEntity(
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
        priceType: priceType,
        location: location,
        deliveryDetails: deliveryDetails,
        purchaseCount: purchaseCount,
      );
}
