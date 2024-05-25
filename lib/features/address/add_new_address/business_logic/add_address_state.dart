part of 'add_address_cubit.dart';

@immutable
abstract class AddAddressState {}

final class AddAddressInitial extends AddAddressState {}

final class AddAddressLoading extends AddAddressState {}

final class AddAddressResult extends AddAddressState {
  final bool success;
  final String message;
  final AddressEntity? address;

  AddAddressResult({
    required this.success,
    required this.message,
    this.address,
  });
}
