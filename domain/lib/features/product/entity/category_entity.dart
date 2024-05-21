import 'package:domain/features/product/entity/product_entity.dart';

class CategoryEntity {
  final int id;
  final String arabicName;
  final String englishName;
  final String imagePath;
  final List<ProductEntity> products;

  const CategoryEntity({
    required this.id,
    required this.arabicName,
    required this.englishName,
    required this.imagePath,
    required this.products,
  });
}
