import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/reset_code_entity.dart';
import 'package:examy_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetCodeUsecase {
  final ForgetPasswordRepo _resetCodeRepo;
  ResetCodeUsecase({required this._resetCodeRepo});
  Future<BaseResponse<void>> verifyResetCode(String code) async {
    final entity = ResetCodeEntity(code: code);

    return await _resetCodeRepo.verifyResetCode(entity);
  }
}
