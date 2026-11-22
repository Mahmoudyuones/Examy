import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/usecase/reset_code_usecase.dart';
import 'package:examy_app/features/auth/forget_password/presentation/cubit/reset_code_cubit/reset_code_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetCodeViewModel extends Cubit<ResetCodeState> {
  final ResetCodeUsecase resetCodeUsecase;
  ResetCodeViewModel({required this.resetCodeUsecase})
    : super(const ResetCodeState.initial());
  Future<void> verifyResetCode(String code) async {
    final response = await resetCodeUsecase.verifyResetCode(code);

    emit(const ResetCodeState.loading());

    switch (response) {
      case SuccessBaseResponse():
        emit(const ResetCodeState.success());
      case ErrorBaseResponse(:final errMessage):
        emit(ResetCodeState.error(errMessage));
    }
  }

  void reset() {
    if (!isClosed) emit(const ResetCodeState.initial());
  }
}
