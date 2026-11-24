import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_body.freezed.dart';

@freezed
abstract class ResetPasswordBody with _$ResetPasswordBody {
  const factory ResetPasswordBody({
    required String email,
    required String newPassword,
  }) = _ResetPasswordBody;
}
