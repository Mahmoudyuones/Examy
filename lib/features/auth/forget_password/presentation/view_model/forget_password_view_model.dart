import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/usecase/forget_password_usecase.dart';

class ForgetPasswordViewModel {
  final ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordViewModel({required this.forgetPasswordUsecase});

  Future<BaseResponse<void>> forgetPassword(String email) async {
    final response = await forgetPasswordUsecase.forgetPassword(email);

    switch (response) {
      case SuccessBaseResponse<void> success:
        return SuccessBaseResponse(data: null);
      case ErrorBaseResponse error:
        return ErrorBaseResponse.fromErrorMsg(error.errMessage);
    }
  }
}
