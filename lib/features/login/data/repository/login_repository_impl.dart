import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/config/network/safe_api_call.dart';
import 'package:examy_app/features/login/data/datasources/local/local_login_data_source.dart';
import 'package:examy_app/features/login/data/datasources/remote/remote_login_data_source.dart';
import 'package:examy_app/features/login/data/mappers/login_request_mapper.dart';
import 'package:examy_app/features/login/domain/entities/login_request_entity.dart';
import 'package:examy_app/features/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final RemoteLoginDataSource remoteDataSource;
  final LocalLoginDataSource localDataSource;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<BaseResponse<void>> login(LoginRequestEntity request) async {
    final remoteResponse = await safeApiCall(
      () => remoteDataSource.login(request.toModel()),
    );
    return remoteResponse.when(
      success: (loginResponse) async {
        if (request.isRememberMe) {
          final localResponse = await localDataSource.cacheUserToken(
            token: loginResponse.token,
          );
          return localResponse.when(
            success: (s) {
              return const BaseResponse<void>.success(null);
            },
            failure: (error) {
              return BaseResponse<void>.failure(error);
            },
          );
        }
        return BaseResponse<void>.success(null);
      },
      failure: (error) {
        return BaseResponse<void>.failure(error);
      },
    );
  }
}
