import 'package:get/get.dart';

extension StringValidation on String? {
  bool isNullOrEmpty() {
    return this == null || this?.isEmpty == true;
  }

  bool isValidEmail() {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this ?? "");
  }

  bool isValidPhoneNumber() {
    final RegExp egyptPhoneNumberRegex = RegExp(
      r'^(?:\+2|002)?\s?(?:010|011|012|015)?[0-9]{8}$',
    );
    return egyptPhoneNumberRegex.hasMatch(this ?? "");
  }
}

class Validator {
  Validator._();

  static String? validateEmail(String? email) {
    if (email.isNullOrEmpty()) {
      return "required_field".tr;
    } else if (!email.isValidEmail()) {
      return "invalid_email".tr;
    }
    return null;
  }
  static String? validatePassword(String? password) {
    if (password.isNullOrEmpty()) {
      return "required_field".tr;
    } else if ((password?.length ?? 0) < 4) {
      return "password_too_short".tr;
    }
    return null;
  }
}
