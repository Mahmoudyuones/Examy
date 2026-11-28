import 'package:examy_app/config/base_state/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_state.freezed.dart';

@freezed
abstract class ForgetPasswordState with _$ForgetPasswordState {
  const factory ForgetPasswordState({
    @Default(BaseState<bool>()) BaseState<bool> forgetPasswordState,
  }) = _ForgetPasswordState;
}
