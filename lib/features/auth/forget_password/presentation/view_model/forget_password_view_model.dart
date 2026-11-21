import 'package:examy_app/features/auth/forget_password/domain/usecase/forget_password_usecase.dart';

class ForgetPasswordViewModel {
  void forgetPassword(String email) {
    ForgetPasswordUsecase().forgetPassword(email);
  }
}
