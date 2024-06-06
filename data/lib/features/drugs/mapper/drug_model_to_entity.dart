import 'package:data/features/drugs/model/drug_model.dart';
import 'package:domain/features/drugs/entity/drug_entity.dart';

extension DrugModelToEntity on DrugModel {
  DrugEntity toEntity() {
    return DrugEntity(
      id: id ?? 0,
      name: name ?? "",
      image: image ?? "",
      price: price ?? 0,
      discountPercentage: discountPercentage ?? 0,
    );
  }
}
