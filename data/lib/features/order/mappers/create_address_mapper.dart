import 'package:data/features/order/model/create_address_model.dart';
import 'package:domain/features/order/entity/create_address_entity.dart';

extension CreateAddressMapper on CreateAddressEntity {
  CreateAddressModel toModel() {
    return CreateAddressModel(
      city: city,
      state: state,
      street: street,
      zipCode: zipCode,
      name: name,
      phoneNumber: phoneNumber,
    );
  }
}
