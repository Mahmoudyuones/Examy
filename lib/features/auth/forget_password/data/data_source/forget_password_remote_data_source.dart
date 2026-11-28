import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:examy_app/features/auth/forget_password/data/models/reset_code_request.dart';
import 'package:examy_app/features/auth/forget_password/data/models/reset_password_request.dart';

abstract interface class ForgetPasswordRemoteDataSource {
  Future<BaseResponse<void>> forgetPassword(ForgetPasswordRequest body);
  Future<BaseResponse<void>> verifyResetCode(ResetCodeRequest code);
  Future<BaseResponse<void>> resetPassword(ResetPasswordRequest body);
}
