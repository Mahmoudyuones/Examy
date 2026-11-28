import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_parm.freezed.dart';

@freezed
abstract class SignUpParm with _$SignUpParm {
  const factory SignUpParm({
    required String username,
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String rePassword,
    required String phone,
  }) = _SignUpParm;
}
