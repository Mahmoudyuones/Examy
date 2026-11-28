import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  // ignore: invalid_annotation_target
  const factory UserModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'firstName') required String firstName,
    @JsonKey(name: 'lastName') required String lastName,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'phone') required String phone,
    @JsonKey(name: 'role') required String role,
    @JsonKey(name: 'isVerified') required bool isVerified,
    @JsonKey(name: 'createdAt') required DateTime createdAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
