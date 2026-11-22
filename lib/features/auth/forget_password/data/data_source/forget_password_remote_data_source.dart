import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_body.dart';
import 'package:examy_app/features/auth/forget_password/data/models/reset_code_body.dart';

abstract class ForgetPasswordRemoteDataSource {
  Future<BaseResponse<void>> forgetPassword(ForgetPasswordBody body);
  Future<BaseResponse<void>> verifyResetCode(ResetCodeBody code);
}
