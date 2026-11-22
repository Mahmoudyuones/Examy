import 'package:json_annotation/json_annotation.dart';

part 'reset_code_response.g.dart';

@JsonSerializable()
class ResetCodeResponse {
  final String code;

  ResetCodeResponse({required this.code});

  factory ResetCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetCodeResponseFromJson(json);
}
