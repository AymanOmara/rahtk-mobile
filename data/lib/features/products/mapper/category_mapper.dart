import 'package:data/features/products/mapper/product_mapper.dart';
import 'package:data/features/products/model/category_model.dart';
import 'package:domain/features/product/entity/category_entity.dart';

extension CategoryMapper on CategoryModel? {
  CategoryEntity toEntity() {
    return CategoryEntity(
      id: this?.id ?? 0,
      imagePath: this?.imagePath ?? "",
      arabicName: this?.arabicName ?? "",
      englishName: this?.englishName ?? "",
      products: this?.products?.map((e) => e.toEntity()).toList() ?? [],
    );
  }
}
extension CategoriesMapper on List<CategoryModel>? {
  List<CategoryEntity> toEntity() {
    return this?.map((e) => e.toEntity()).toList() ?? [];
  }
}