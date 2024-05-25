import 'package:data/network/encode_able.dart';

class CreateAddressModel implements EncodeAble {
  final String name;
  final String phoneNumber;
  final String state;
  final String zipCode;
  final String street;
  final String city;

  CreateAddressModel({
    required this.name,
    required this.phoneNumber,
    required this.state,
    required this.zipCode,
    required this.street,
    required this.city,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
      "state": state,
      "zipCode": zipCode,
      "street": street,
      "city": city
    };
  }
}
