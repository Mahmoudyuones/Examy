import 'package:examy_app/core/constants/ui_strings.dart';

import '../constants/validation_constants.dart';
import 'app_regex.dart';

extension StringValidation on String? {
  String? get validateEmail {
    if (this == null || this!.trim().isEmpty) {
      return ValidationConstants.emailRequired;
    }
    if (!AppRegex.isEmailValid(this!.trim())) {
      return ValidationConstants.invalidEmail;
    }
    return null;
  }

  String? get validateLoginPassword {
    if (this == null ||
        this!.isEmpty ||
        this!.trim().isEmpty ||
        this!.length < 8) {
      return ValidationConstants.passwordRequired;
    }
    return null;
  }

  String? get validatePassword {
    if (this == null || this!.isEmpty) {
      return ValidationConstants.passwordRequired;
    }
    if (!AppRegex.hasMinLength(this!)) {
      return ValidationConstants.passwordMinLength;
    }
    if (!AppRegex.hasUpperCase(this!)) {
      return ValidationConstants.passwordUpperCase;
    }
    if (!AppRegex.hasLowerCase(this!)) {
      return ValidationConstants.passwordLowerCase;
    }
    if (!AppRegex.hasNumber(this!)) {
      return ValidationConstants.passwordNumber;
    }
    if (!AppRegex.hasSpecialCharacter(this!)) {
      return ValidationConstants.passwordSpecialChar;
    }
    return null;
  }

  String? validateMatch(String? originalValue) {
    if (this == null || this!.isEmpty) {
      return ValidationConstants.confirmPasswordRequired;
    }
    if (this != originalValue) {
      return ValidationConstants.passwordsDoNotMatch;
    }
    return null;
  }

  String? get validateRequired {
    if (this == null || this!.trim().isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateMinLength(int minLength, {String? errorMessage}) {
    if (this == null || this!.length < minLength) {
      return errorMessage ?? 'Must be at least $minLength characters';
    }
    return null;
  }

  String? validateMaxLength(int maxLength, {String? errorMessage}) {
    if (this != null && this!.length > maxLength) {
      return errorMessage ?? 'Must be at most $maxLength characters';
    }
    return null;
  }
}

class AppValidators {
  static String? validateEmail(String? value) => value.validateEmail;

  static String? validatePassword(String? value) => value.validatePassword;

  static String? validateLoginPassword(String? value) =>
      value.validateLoginPassword;

  static String? validateConfirmPassword(
    String? value,
    String? originalPassword,
  ) => value.validateMatch(originalPassword);

  static String? validateRequired(String? value) => value.validateRequired;

  /// ================= PHONE (UPDATED) =================
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return ValidationConstants.phoneNumberRequired;
    }

    if (!AppRegex.isPhoneValid(value)) {
      return ValidationConstants.invalidPhoneNumber;
    }

    return null;
  }
}

class Validators {
  static bool isEmail(String v) =>
      RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim());

  static String? email(String? v) =>
      (v == null || !isEmail(v)) ? AppStrings.emailNotValid : null;

  static String? password(String? v) {
    final p = v ?? '';
    final ok =
        p.length >= 6 &&
        RegExp(r'[A-Z]').hasMatch(p) &&
        RegExp(r'\d').hasMatch(p);
    return ok ? null : AppStrings.passwordNotValid;
  }
}
