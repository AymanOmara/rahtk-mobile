import 'package:data/features/order/model/address_model.dart';
import 'package:domain/features/order/entity/address_entity.dart';

extension AddressEntityMapper on AddressModel {
  AddressEntity toEntity() {
    return AddressEntity(
      name: name ?? "",
      phoneNumber: phoneNumber ?? "",
      address: address ?? "",
      state: state ?? "",
      street: street ?? "",
      city: city ?? "",
      id:  id ?? 0,
    );
  }
}
