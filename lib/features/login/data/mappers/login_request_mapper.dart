import 'package:examy_app/features/login/data/models/login_request_model.dart';
import 'package:examy_app/features/login/domain/entities/login_request_entity.dart';

extension LoginRequestEntityMapper on LoginRequestEntity {
  LoginRequestModel toModel() {
    return LoginRequestModel(email: email, password: password);
  }
}
