import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:examy_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ForgetPasswordUsecase {
  final ForgetPasswordRepo forgetPasswordRepo;
  ForgetPasswordUsecase({required this.forgetPasswordRepo});

  Future<BaseResponse<void>> forgetPassword(String email) async {
    final entity = ForgetPasswordEntity(email: email);
    switch (await forgetPasswordRepo.forgetPassword(entity)) {
      case SuccessBaseResponse<void> success:
        return SuccessBaseResponse(data: null);
      case ErrorBaseResponse error:
        return ErrorBaseResponse.fromErrorMsg(error.errMessage);
    }
  }
}
