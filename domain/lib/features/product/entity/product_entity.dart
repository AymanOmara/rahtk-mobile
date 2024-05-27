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
  final bool isFavorite;
  final String condition;
  final String priceType;
  final String categoryNameAr;
  final String categoryNameEn;
  final String location;
  final String deliveryDetails;
  final int purchaseCount;

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
    required this.isFavorite,
    required this.condition,
    required this.categoryNameAr,
    required this.categoryNameEn,
    required this.priceType,
    required this.location,
    required this.deliveryDetails,
    required this.purchaseCount,
  });
}
