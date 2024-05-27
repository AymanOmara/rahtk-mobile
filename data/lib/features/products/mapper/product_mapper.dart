import 'package:data/features/products/model/product_model.dart';
import 'package:domain/features/product/entity/product_entity.dart';

extension ProductMapper on ProductModel? {
  ProductEntity toEntity() {
    return ProductEntity(
      id: this?.id ?? 0,
      image: this?.imagePath ?? "",
      arabicDescription: this?.arabicDescription ?? "",
      englishDescription: this?.englishDescription ?? "",
      price: this?.price ?? 0,
      discountPercentage: this?.discount ?? 0,
      arabicName: this?.arabicName ?? "",
      englishName: this?.englishName ?? "",
      createdAt: this?.createdDate ?? "",
      categoryId: this?.categoryId ?? 0,
      isFavorite: this?.isFavorite ?? false,
      priceType: this?.priceType ?? "",
      condition: this?.condition ?? "",
      categoryNameEn: this?.categoryNameEn ?? "",
      categoryNameAr: this?.categoryNameAr ?? "",
      location: this?.location ?? "",
      deliveryDetails: this?.deliveryDetails ?? "",
      purchaseCount:  this?.purchaseCount ?? 0,
    );
  }
}

extension ProductsMapper on List<ProductModel> {
  List<ProductEntity> toEntity() {
    return map((e) => e.toEntity()).toList();
  }
}
