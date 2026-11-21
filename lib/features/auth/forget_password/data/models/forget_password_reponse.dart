import 'package:json_annotation/json_annotation.dart';

part 'forget_password_reponse.g.dart';

@JsonSerializable()
class ForgetPasswordResponse {
  final String? message;

  ForgetPasswordResponse({this.message});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      _$ForgetPasswordResponseFromJson(json);
}
