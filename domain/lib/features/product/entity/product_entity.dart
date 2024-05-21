class ProductEntity {
  final int id;
  final String arabicName;
  final String englishName;
  final String arabicDescription;
  final String englishDescription;
  final double price;
  final double discountPercentage;
  final String image;
  final String createdAt;
  final int categoryId;

  const ProductEntity({
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
  });
}
