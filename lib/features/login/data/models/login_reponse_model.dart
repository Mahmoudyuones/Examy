import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_model.dart';

part 'login_reponse_model.freezed.dart';
part 'login_reponse_model.g.dart';

LoginResponseModel loginResponseModelFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) =>
    json.encode(data.toJson());

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory LoginResponseModel({
    @JsonKey(name: 'message') required String message,
    @JsonKey(name: 'token') required String token,
    @JsonKey(name: 'user') required UserModel user,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
