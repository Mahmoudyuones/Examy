import 'package:examy_app/features/login/data/models/login_reponse_model.dart';
import 'package:examy_app/features/login/data/models/login_request_model.dart';

abstract interface class RemoteLoginDataSource {
  Future<LoginResponseModel> login(LoginRequestModel body);
}
