import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_code_request.freezed.dart';

@freezed
abstract class ResetCodeRequest with _$ResetCodeRequest {
  const factory ResetCodeRequest({required String resetCode}) =
      _ResetCodeRequest;
}
