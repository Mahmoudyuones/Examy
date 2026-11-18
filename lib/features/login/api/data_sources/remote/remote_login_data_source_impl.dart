import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/config/network/safe_api_call.dart';
import 'package:examy_app/features/login/api/api_client/login_api_client.dart';
import 'package:examy_app/features/login/data/datasources/remote/remote_login_data_source.dart';
import 'package:examy_app/features/login/data/models/login_reponse_model.dart';
import 'package:examy_app/features/login/data/models/login_request_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: RemoteLoginDataSource)
class RemoteLoginDataSourceImpl implements RemoteLoginDataSource {
  final LoginApiClient _loginApiClient;
  RemoteLoginDataSourceImpl(this._loginApiClient);

  @override
  Future<BaseResponse<LoginResponseModel>> login(LoginRequestModel body) {
    return safeApiCall<LoginResponseModel>(() => _loginApiClient.login(body));
  }
}
