// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../cache_modules/secure_storage_module.dart' as _i460;
import '../dio_module/auth_interceptor.dart' as _i672;
import '../dio_module/dio_module.dart' as _i1055;
import '../dio_module/logger_interceptor.dart' as _i325;
import '../services/session_manager.dart' as _i853;
import '../services/token_service.dart' as _i786;

extension GetItInjectableX on _i174.GetIt {
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _i1055.DioModule();

    gh.singleton<_i672.AuthInterceptor>(() => _i672.AuthInterceptor());
    gh.singleton<_i325.LoggerInterceptor>(() => _i325.LoggerInterceptor());
    gh.singleton<_i460.SecureStorageService>(
      () => _i460.SecureStorageService(),
    );
    gh.singleton<_i853.SessionManager>(() => _i853.SessionManager());
    gh.singleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i672.AuthInterceptor>(),
        gh<_i325.LoggerInterceptor>(),
      ),
    );
    gh.factory<_i786.TokenService>(
      () => _i786.TokenService(gh<_i460.SecureStorageService>()),
    );

    return this;
  }
}

