import 'package:freezed_annotation/freezed_annotation.dart';

part 'forget_password_entity.freezed.dart';

@freezed
abstract class ForgetPasswordEntity with _$ForgetPasswordEntity {
  const factory ForgetPasswordEntity({required String email}) =
      _ForgetPasswordEntity;
}
