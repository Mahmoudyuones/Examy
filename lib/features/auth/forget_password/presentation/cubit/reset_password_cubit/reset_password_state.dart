import 'package:examy_app/config/base_state/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_state.freezed.dart';

@freezed
abstract class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    @Default(BaseState<bool>()) BaseState<bool> resetPasswordState,
  }) = _ResetPasswordState;
}
