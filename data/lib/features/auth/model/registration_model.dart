import 'package:data/network/encode_able.dart';

class RegistrationModel implements EncodeAble {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  const RegistrationModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    };
  }
}
