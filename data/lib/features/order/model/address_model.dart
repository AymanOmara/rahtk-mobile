import 'package:data/network/decode_able.dart';

class AddressModel implements DecodeAble<AddressModel, Map?> {
  int? id;
  String? name;
  String? phoneNumber;
  String? address;
  String? state;
  String? street;
  String? city;

  @override
  AddressModel fromJson(Map? json) {
    return AddressModel()
      ..name = json?['name']
      ..id = json?['id']
      ..phoneNumber = json?['phoneNumber']
      ..address = json?['address']
      ..state = json?['state']
      ..street = json?['street']
      ..city = json?['city'];
  }
}
