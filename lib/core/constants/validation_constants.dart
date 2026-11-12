abstract class ValidationConstants {
  // Email
  static const String emailRequired = 'Email is required';
  static const String invalidEmail = 'Please enter a valid email address';

  // Password
  static const String passwordRequired = 'Password is required';
  static const String passwordMinLength =
      'Password must be at least 8 characters';
  static const String passwordUpperCase =
      'Password must contain at least one uppercase letter';
  static const String passwordLowerCase =
      'Password must contain at least one lowercase letter';
  static const String passwordNumber =
      'Password must contain at least one number';
  static const String passwordSpecialChar =
      'Password must contain at least one special character (@\$#!%*?&)';

  // Confirm Password
  static const String confirmPasswordRequired = 'Please confirm your password';
  static const String passwordsDoNotMatch = 'Passwords do not match';

  // Phone
  static const String phoneNumberRequired = 'Phone number is required';
  static const String invalidPhoneNumber =
      'Please enter a valid Egyptian phone number';
}

