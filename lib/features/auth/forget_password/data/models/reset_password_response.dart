import 'package:json_annotation/json_annotation.dart';

part 'reset_password_response.g.dart';

@JsonSerializable()
class ResetPasswordResponse {
  final String email;
  final String newPassword;

  ResetPasswordResponse({required this.email, required this.newPassword});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return _$ResetPasswordResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResetPasswordResponseToJson(this);
  }
}
