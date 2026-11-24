import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_code_body.freezed.dart';

@freezed
abstract class ResetCodeBody with _$ResetCodeBody {
  const factory ResetCodeBody({required String resetCode}) = _ResetCodeBody;
}
