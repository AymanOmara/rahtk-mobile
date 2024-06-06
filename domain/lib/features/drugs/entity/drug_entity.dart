class DrugEntity {
  final int id;
  final String name;
  final String image;
  final double price;
  final double discountPercentage;

  const DrugEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.discountPercentage,
  });
  String discountPrice() {
    var amount = (price - (price * (discountPercentage / 100))).toString();
    return amount == price.toString() ? "" : amount;
  }
}
