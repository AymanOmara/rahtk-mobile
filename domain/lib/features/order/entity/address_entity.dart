class AddressEntity {
  final int id;
  String name;
  String phoneNumber;
  String address;
  String state;
  String street;
  String city;

  AddressEntity({
    required this.name,
    required this.phoneNumber,
    required this.address,
    required this.state,
    required this.street,
    required this.city,
    required this.id,
  });
  @override
  String toString(){
    return '${state} ${city} ${street} ${address}';
  }
}
