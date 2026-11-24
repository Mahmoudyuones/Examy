import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_body.freezed.dart';
part 'forget_password_body.g.dart';

@freezed
abstract class ForgetPasswordBody with _$ForgetPasswordBody {
  const factory ForgetPasswordBody({required String email}) =
      _ForgetPasswordBody;

  factory ForgetPasswordBody.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordBodyFromJson(json);
}
