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

import '../../features/auth/forget_password/api/api_client/api_client.dart'
    as _i558;
import '../../features/auth/forget_password/api/data_source/forget_password_remote_data_source_impl.dart'
    as _i159;
import '../../features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart'
    as _i951;
import '../../features/auth/forget_password/data/repo/forget_password_repo_impl.dart'
    as _i610;
import '../../features/auth/forget_password/domain/repo/forget_password_repo.dart'
    as _i484;
import '../../features/auth/forget_password/domain/usecase/forget_password_usecase.dart'
    as _i930;
import '../../features/auth/forget_password/domain/usecase/reset_code_usecase.dart'
    as _i467;
import '../../features/auth/forget_password/domain/usecase/reset_password_usecase.dart'
    as _i383;
import '../../features/auth/forget_password/presentation/cubit/forget_password_cubit/forget_password_view_model.dart'
    as _i902;
import '../../features/auth/forget_password/presentation/cubit/reset_code_cubit/reset_code_view_model.dart'
    as _i425;
import '../../features/auth/forget_password/presentation/cubit/reset_password_cubit/reset_password_view_model.dart'
    as _i619;
import '../dio_module/auth_interceptor.dart' as _i815;
import '../dio_module/dio_module.dart' as _i773;
import '../dio_module/logger_interceptor.dart' as _i754;
import '../services/session_manager.dart' as _i118;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i815.AuthInterceptor>(() => _i815.AuthInterceptor());
    gh.singleton<_i754.LoggerInterceptor>(() => _i754.LoggerInterceptor());
    gh.singleton<_i118.SessionManager>(
      () => _i118.SessionManager(),
      dispose: (i) => i.dispose(),
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.dio(
        gh<_i815.AuthInterceptor>(),
        gh<_i754.LoggerInterceptor>(),
      ),
    );
    gh.lazySingleton<_i558.ForgetPasswordClient>(
      () => _i558.ForgetPasswordClient(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i951.ForgetPasswordRemoteDataSource>(
      () => _i159.ForgetPasswordRemoteDataSourceImpl(
        forgetPasswordClient: gh<_i558.ForgetPasswordClient>(),
      ),
    );
    gh.lazySingleton<_i484.ForgetPasswordRepo>(
      () => _i610.ForgetPasswordRepoImpl(
        remoteDataSource: gh<_i951.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i383.ResetPasswordUsecase>(
      () => _i383.ResetPasswordUsecase(gh<_i484.ForgetPasswordRepo>()),
    );
    gh.factory<_i467.ResetCodeUsecase>(
      () =>
          _i467.ResetCodeUsecase(resetCodeRepo: gh<_i484.ForgetPasswordRepo>()),
    );
    gh.factory<_i619.ResetPasswordViewModel>(
      () => _i619.ResetPasswordViewModel(
        resetPasswordUsecase: gh<_i383.ResetPasswordUsecase>(),
      ),
    );
    gh.factory<_i425.ResetCodeViewModel>(
      () => _i425.ResetCodeViewModel(
        resetCodeUsecase: gh<_i467.ResetCodeUsecase>(),
      ),
    );
    gh.factory<_i930.ForgetPasswordUsecase>(
      () => _i930.ForgetPasswordUsecase(
        forgetPasswordRepo: gh<_i484.ForgetPasswordRepo>(),
      ),
    );
    gh.factory<_i902.ForgetPasswordViewModel>(
      () => _i902.ForgetPasswordViewModel(
        forgetPasswordUsecase: gh<_i930.ForgetPasswordUsecase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i773.DioModule {}
