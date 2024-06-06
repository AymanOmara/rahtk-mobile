import 'package:domain/features/drugs/entity/drug_entity.dart';

class CartDrugDisplay {
  final DrugEntity drug;
  int count = 1;

  CartDrugDisplay({
    required this.drug,
  });
  double getFullPrice() {
    double discountedPrice = drug.price - (drug.price * (drug.discountPercentage / 100));
    return discountedPrice * count;
  }
}
