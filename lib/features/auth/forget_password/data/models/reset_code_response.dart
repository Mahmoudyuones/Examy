import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_code_response.freezed.dart';
part 'reset_code_response.g.dart';

@freezed
abstract class ResetCodeResponse with _$ResetCodeResponse {
  const factory ResetCodeResponse({required String code}) = _ResetCodeResponse;

  factory ResetCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetCodeResponseFromJson(json);
}
