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
  Future<LoginResponseModel> login(LoginRequestModel body) =>
      _loginApiClient.login(body);
}
