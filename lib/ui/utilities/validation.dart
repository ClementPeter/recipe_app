import 'package:receipe_app/generated/l10n.dart';
import 'package:receipe_app/ui/utilities/string_utils.dart';

class Validation {
  static String? validateEmail(String? s) {
    if (StringUtil.isEmpty(s)) {
      return S.current.email_cannot_be_empty;
    } else if (!StringUtil.isValidEmail(s!)) {
      return S.current.email_must_be_a_valid_email;
    } else {
      return null;
    }
  }

  static String? validateField(String? s, {String? errorMessage}) {
    if (StringUtil.isEmpty(s)) {
      return errorMessage ?? S.current.field_required;
    } else {
      return null;
    }
  }

  static String? validatePassword(String? s, {String? errorMessage}) {
    if (StringUtil.isEmpty(s)) {
      return errorMessage ?? S.current.password_required;
    } else if (s!.length <= 3) {
      return S.current.password_too_short;
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return S.current.phone_number_empty;
    }

    try {
      int phoneValue = int.parse(phoneNumber);
      if (phoneNumber.length < 10) {
        return S.current.phone_number_not_complete;
      }
    } catch (e) {
      return S.current.phone_number_invalid;
    }

    return null;
  }
}
