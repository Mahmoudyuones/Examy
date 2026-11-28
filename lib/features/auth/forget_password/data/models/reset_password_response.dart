import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_response.freezed.dart';
part 'reset_password_response.g.dart';

@freezed
abstract class ResetPasswordResponse with _$ResetPasswordResponse {
  const factory ResetPasswordResponse({
    required String email,
    required String newPassword,
  }) = _ResetPasswordResponse;

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordResponseFromJson(json);
}
