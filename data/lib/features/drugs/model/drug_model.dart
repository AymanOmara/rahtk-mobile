import 'package:data/network/decode_able.dart';

class DrugModel implements DecodeAble<DrugModel, Map?> {
  int? id;
  String? name;
  String? image;
  double? price;
  double? discountPercentage;
  @override
  DrugModel fromJson(Map? map) {
    return DrugModel()
      ..image = map?['imagePath']
      ..name = map?['name']
      ..price = map?["price"]
      ..discountPercentage = map?["discountPercentage"]
      ..id = map?['id'];
  }
}

class DrugsModel implements DecodeAble<List<DrugModel>, List?> {
  @override
  List<DrugModel> fromJson(List? json) {
    return json?.map<DrugModel>((e) => DrugModel().fromJson(e)).toList() ?? [];
  }
}
