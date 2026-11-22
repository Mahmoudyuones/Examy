import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/usecase/reset_password_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'reset_password_state.dart';

@injectable
class ResetPasswordViewModel extends Cubit<ResetPasswordState> {
  final ResetPasswordUsecase resetPasswordUsecase;
  ResetPasswordViewModel({required this.resetPasswordUsecase})
    : super(const ResetPasswordState.initial());

  Future<void> resetPassword(String email, String newPassword) async {
    emit(const ResetPasswordState.loading());
    final response = await resetPasswordUsecase.resetPassword(
      email,
      newPassword,
    );

    switch (response) {
      case SuccessBaseResponse():
        emit(const ResetPasswordState.success());
      case ErrorBaseResponse(:final errMessage):
        emit(ResetPasswordState.error(errMessage));
    }
  }
}
