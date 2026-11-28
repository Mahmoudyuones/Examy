import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_request.freezed.dart';

@freezed
abstract class ResetPasswordRequest with _$ResetPasswordRequest {
  const factory ResetPasswordRequest({
    required String email,
    required String newPassword,
  }) = _ResetPasswordRequest;
}
