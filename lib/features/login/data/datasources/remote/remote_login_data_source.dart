import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/login/data/models/login_reponse_model.dart';
import 'package:examy_app/features/login/data/models/login_request_model.dart';

abstract interface class RemoteLoginDataSource {
  Future<BaseResponse<LoginResponseModel>> login(LoginRequestModel body);
}
