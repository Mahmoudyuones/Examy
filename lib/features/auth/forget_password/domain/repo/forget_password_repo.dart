import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/reset_code_entity.dart';

abstract class ForgetPasswordRepo {
  Future<BaseResponse<void>> forgetPassword(ForgetPasswordEntity entity);
  Future<BaseResponse<void>> verifyResetCode(ResetCodeEntity code);
}
