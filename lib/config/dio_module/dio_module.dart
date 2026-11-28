import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../core/constants/app_endpoints.dart';
import 'auth_interceptor.dart';
import 'logger_interceptor.dart';

@module
abstract class DioModule {
  @singleton
  Dio dio(
    AuthInterceptor authInterceptor,
    LoggerInterceptor loggerInterceptor,
  ) {
    final dio = Dio(
      BaseOptions(
        baseUrl: AppEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );

    dio.interceptors.addAll([
      authInterceptor,
      if (kDebugMode) loggerInterceptor,
    ]);

    return dio;
  }
}
