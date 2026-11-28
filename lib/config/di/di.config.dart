// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/sign_up/api/api_client/api_client.dart' as _i1009;
import '../../features/sign_up/api/data_source/signup_remote_data_source_impl.dart'
    as _i1058;
import '../../features/sign_up/data/data_sources/signup_remote_data_source.dart'
    as _i113;
import '../cache_modules/secure_storage_module.dart' as _i11;
import '../dio_module/auth_interceptor.dart' as _i815;
import '../dio_module/dio_module.dart' as _i773;
import '../dio_module/logger_interceptor.dart' as _i754;
import '../services/session_manager.dart' as _i118;
import '../services/token_service.dart' as _i227;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i11.SecureStorageService>(() => _i11.SecureStorageService());
    gh.singleton<_i815.AuthInterceptor>(() => _i815.AuthInterceptor());
    gh.singleton<_i754.LoggerInterceptor>(() => _i754.LoggerInterceptor());
    gh.singleton<_i118.SessionManager>(
      () => _i118.SessionManager(),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i227.TokenService>(
      () => _i227.TokenService(gh<_i11.SecureStorageService>()),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i815.AuthInterceptor>(),
        gh<_i754.LoggerInterceptor>(),
      ),
    );
    gh.factory<_i1009.SignupApiClient>(
      () => _i1009.SignupApiClient(gh<_i361.Dio>()),
    );
    gh.factory<_i113.SignupRemoteDataSource>(
      () => _i1058.SignupRemoteDataSourceImpl(gh<_i1009.SignupApiClient>()),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
