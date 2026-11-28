abstract class AppEndpoints {
  static const String baseUrl = 'https://exam.elevateegy.com';
  static const String forgetPasswordEndpoint = '/api/v1/auth/forgotPassword';
  static const String verifyResetCode = '/api/v1/auth/verifyResetCode';
  static const String resetPasswordEndpoint = '/api/v1/auth/resetPassword';
  static const String genericErrorMsg =
      'Something went wrong. Please try again later.';
}
