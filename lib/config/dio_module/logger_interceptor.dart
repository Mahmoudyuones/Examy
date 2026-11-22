import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@singleton
@singleton
class LoggerInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('REQUEST[${options.method}] => ${options.baseUrl}${options.path}');
    log('Headers: ${options.headers}');
    log('Body: ${options.data}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    log('Data: ${response.data}');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    log('Request body: ${err.requestOptions.data}');
    log('Server response: ${err.response?.data}');
    handler.next(err);
  }
}
