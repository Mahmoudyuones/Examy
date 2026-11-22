import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_code_state.freezed.dart';

@freezed
class ResetCodeState with _$ResetCodeState {
  const factory ResetCodeState.initial() = _Initial;
  const factory ResetCodeState.loading() = _Loading;
  const factory ResetCodeState.success() = _Success;
  const factory ResetCodeState.error(String message) = _Error;
}
