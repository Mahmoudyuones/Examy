import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:examy_app/features/auth/forget_password/domain/repo/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetPasswordUsecase {
  final ResetPasswordRepo _resetPasswordRepo;

  ResetPasswordUsecase(this._resetPasswordRepo);

  Future<BaseResponse<void>> resetPassword(
    String email,
    String newPassword,
  ) async {
    final entity = ResetPasswordEntity(email: email, newPassword: newPassword);

    final response = await _resetPasswordRepo.resetPassword(entity);

    switch (response) {
      case SuccessBaseResponse():
        return SuccessBaseResponse(data: null);
      case ErrorBaseResponse error:
        return ErrorBaseResponse.fromErrorMsg(error.errMessage);
    }
  }
}
