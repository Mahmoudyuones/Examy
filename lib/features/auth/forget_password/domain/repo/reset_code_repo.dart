import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/reset_code_entity.dart';

abstract class ResetCodeRepo {
  Future<BaseResponse<void>> verifyResetCode(ResetCodeEntity code);
}
