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

  static String? validateConfirmPassword(
    String? confirmPassword,
    String? password,
  ) {
    if (confirmPassword.isNullOrEmpty()) {
      return "required_field".tr;
    } else if ((confirmPassword?.length ?? 0) < 4) {
      return "password_too_short".tr;
    } else if (confirmPassword != password) {
      return "passwords_don't_match".tr;
    }
    return null;
  }
  static String? validatePhone(String? phone) {
    if (phone.isNullOrEmpty()) {
      return "required_field".tr;
    }
    final RegExp egyptPhoneNumberRegex = RegExp(
      r'^(?:010|011|012|015)?[0-9]{8}$',
    );
    if(egyptPhoneNumberRegex.hasMatch(phone ?? "")){
      return null;
    }
    return "invalid_phone".tr;

  }
  static String? validateRequired(String? txt) {
    if (txt.isNullOrEmpty()) {
      return "required_field".tr;
    }
    return null;
  }
}
extension ArrayUtils<T> on List<T> {
  void updateWhere(bool Function(T) condition, T newItem) {
    final index = indexWhere(condition);
    if (index != -1) {
      this[index] = newItem;
    }
  }
}