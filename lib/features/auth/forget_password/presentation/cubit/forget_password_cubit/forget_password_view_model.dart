import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/usecase/forget_password_usecase.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/forget_password_cubit/forget_password_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'forget_password_state.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordState> {
  final ForgetPasswordUsecase _forgetPasswordUsecase;
  ForgetPasswordViewModel({required this._forgetPasswordUsecase})
    : super(const ForgetPasswordState.initial());

  void doEvent(ForgetPasswordEvent event) {
    switch (event) {
      case SendEmail(:final email):
        _forgetPassword(email);
    }
  }

  Future<void> _forgetPassword(String email) async {
    emit(const ForgetPasswordState.loading());
    final response = await _forgetPasswordUsecase.forgetPassword(email);

    switch (response) {
      case SuccessBaseResponse():
        emit(const ForgetPasswordState.success());
      case ErrorBaseResponse(:final errMessage):
        emit(ForgetPasswordState.error(errMessage));
    }
  }
}
