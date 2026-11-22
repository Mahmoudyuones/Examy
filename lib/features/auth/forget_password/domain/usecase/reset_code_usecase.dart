import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/reset_code_entity.dart';
import 'package:examy_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetCodeUsecase {
  final ForgetPasswordRepo forgetPasswordRepo;
  ResetCodeUsecase({required this.forgetPasswordRepo});
  Future<BaseResponse<void>> verifyResetCode(String code) async {
    final entity = ResetCodeEntity(code: code);

    final response = await forgetPasswordRepo.verifyResetCode(entity);

    switch (response) {
      case SuccessBaseResponse<void> response:
        return SuccessBaseResponse(data: null);
      case ErrorBaseResponse error:
        return ErrorBaseResponse.fromErrorMsg(error.errMessage);
    }
  }
}
