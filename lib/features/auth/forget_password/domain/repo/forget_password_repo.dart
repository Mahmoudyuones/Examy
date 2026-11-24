import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';

abstract interface class ForgetPasswordRepo {
  Future<BaseResponse<void>> forgetPassword(ForgetPasswordEntity entity);
}
