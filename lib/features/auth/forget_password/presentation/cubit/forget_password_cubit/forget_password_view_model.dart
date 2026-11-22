import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/usecase/forget_password_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase forgetPasswordUsecase;
  ForgetPasswordViewModel({required this.forgetPasswordUsecase})
    : super(const ForgetPasswordState.initial());

  Future<void> forgetPassword(String email) async {
    emit(const ForgetPasswordState.loading());
    final response = await forgetPasswordUsecase.forgetPassword(email);

    switch (response) {
      case SuccessBaseResponse():
        emit(const ForgetPasswordState.success());
      case ErrorBaseResponse(:final errMessage):
        emit(ForgetPasswordState.error(errMessage));
    }
  }
}
