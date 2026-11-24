import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/config/services/token_service.dart';
import 'package:examy_app/features/login/data/datasources/local/local_login_data_source.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LocalLoginDataSource)
class LocalLoginDataSourceImpl implements LocalLoginDataSource {
  final TokenService _tokenService;

  LocalLoginDataSourceImpl(this._tokenService);

  @override
  Future<BaseResponse<bool>> cacheUserToken({required String token}) {
    return _tokenService.saveToken(token);
  }
}
