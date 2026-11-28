import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/config/base_state/base_state.dart';
import 'package:examy_app/features/auth/forget_password/domain/usecase/forget_password_usecase.dart';
import 'package:examy_app/features/auth/forget_password/domain/usecase/reset_code_usecase.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_code_cubit/reset_code_event.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_code_cubit/reset_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetCodeViewModel extends Cubit<ResetCodeState> {
  final ResetCodeUsecase _resetCodeUsecase;
  final ForgetPasswordUsecase _forgetPasswordUsecase;

  ResetCodeViewModel(this._resetCodeUsecase, this._forgetPasswordUsecase)
    : super(const ResetCodeState());

  void doEvent(ResetCodeEvent event) {
    switch (event) {
      case EmailVerification(:final code):
        _verifyResetCode(code);
      case ResendCode(:final email):
        _resendCode(email);
    }
  }

  Future<void> _verifyResetCode(String code) async {
    emit(
      state.copyWith(verifyCodeState: const BaseState<bool>(isLoading: true)),
    );

    final response = await _resetCodeUsecase.verifyResetCode(code);

    switch (response) {
      case SuccessBaseResponse():
        emit(
          state.copyWith(verifyCodeState: const BaseState<bool>(data: true)),
        );
      case ErrorBaseResponse(:final errMessage):
        emit(
          state.copyWith(
            verifyCodeState: BaseState<bool>(errorMessage: errMessage),
          ),
        );
    }
  }

  Future<void> _resendCode(String email) async {
    emit(
      state.copyWith(resendCodeState: const BaseState<bool>(isLoading: true)),
    );

    final response = await _forgetPasswordUsecase.forgetPassword(email);

    switch (response) {
      case SuccessBaseResponse():
        emit(
          state.copyWith(resendCodeState: const BaseState<bool>(data: true)),
        );
      case ErrorBaseResponse(:final errMessage):
        emit(
          state.copyWith(
            resendCodeState: BaseState<bool>(errorMessage: errMessage),
          ),
        );
    }
  }

  void reset() {
    if (!isClosed) emit(const ResetCodeState());
  }
}
