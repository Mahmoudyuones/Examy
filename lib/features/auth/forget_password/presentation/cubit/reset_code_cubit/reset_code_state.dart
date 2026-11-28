import 'package:examy_app/config/base_state/base_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_code_state.freezed.dart';

@freezed
abstract class ResetCodeState with _$ResetCodeState {
  const factory ResetCodeState({
    @Default(BaseState<bool>()) BaseState<bool> verifyCodeState,
    @Default(BaseState<bool>()) BaseState<bool> resendCodeState,
  }) = _ResetCodeState;
}
