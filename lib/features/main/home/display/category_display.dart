import 'package:domain/features/product/entity/category_entity.dart';
import 'package:rahtk_mobile/features/main/home/display/product_display.dart';
import 'package:get/get.dart';

class CategoryDisplay {
  final int id;
  final String arabicName;
  final String englishName;
  final String imagePath;
  final List<ProductDisplay> products;

  String get localizedName =>
      Get.locale?.languageCode == "ar" ? arabicName : englishName;

  const CategoryDisplay({
    required this.id,
    required this.arabicName,
    required this.englishName,
    required this.imagePath,
    required this.products,
  });
}

extension CategoryDisplayMapper on CategoryEntity {
  CategoryDisplay toDisplay() {
    return CategoryDisplay(
      id: id,
      arabicName: arabicName,
      englishName: englishName,
      imagePath: imagePath,
      products: products.toDisplayList(),
    );
  }
}
