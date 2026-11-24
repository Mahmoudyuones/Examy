import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/reset_password_entity.dart';

abstract interface class ResetPasswordRepo {
  Future<BaseResponse<void>> resetPassword(ResetPasswordEntity entity);
}
