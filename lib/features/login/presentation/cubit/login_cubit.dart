import 'package:examy_app/features/login/domain/entities/login_request_entity.dart';
import 'package:examy_app/features/login/domain/usecases/login_use_case.dart';
import 'package:examy_app/features/login/presentation/cubit/login_events.dart';
import 'package:examy_app/features/login/presentation/cubit/login_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit(this._loginUseCase) : super(const LoginState());

  void onEvent(LoginEvents event) {
    switch (event) {
      case LoginSubmittedEvent():
        _login(email: event.email, password: event.password);
    }
  }

  Future<void> _login({required String email, required String password}) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, clearErrMsg: true));

    final response = await _loginUseCase(
      LoginRequestEntity(
        email: email,
        password: password,
        isRememberMe: state.rememberMe,
      ),
    );

    response.when(
      success: (_) => emit(state.copyWith(isLoading: false, isSuccess: true)),
      failure: (error) =>
          emit(state.copyWith(isLoading: false, errMsg: error.message)),
    );
  }
}
