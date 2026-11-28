import 'package:examy_app/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:examy_app/features/sign_up/domain/entities/sign_up_parm.dart';

extension SignUpParmMapper on SignUpParm {
  SignUpRequestModel toModel() {
    return SignUpRequestModel(
      username: username,
      firstName: firstName,
      lastName: lastName,
      email: email,
      password: password,
      rePassword: rePassword,
      phone: phone,
    );
  }
}
