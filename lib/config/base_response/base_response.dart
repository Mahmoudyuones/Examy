import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:examy_app/core/constants/api_constants.dart';

sealed class BaseResponse<T> {}

class SuccessBaseResponse<T> extends BaseResponse<T> {
  final T data;

  SuccessBaseResponse({required this.data});
}

class ErrorBaseResponse<T> extends BaseResponse<T> {
  final String errMessage;

  ErrorBaseResponse.fromErrorMsg(this.errMessage);

  ErrorBaseResponse({Object? errorObj})
    : errMessage = errorObj == null
          ? ApiConstants.genericErrorMsg
          : _getErrorMsg(errorObj);

  static String _getErrorMsg(Object error) {
    if (error is DioException) {
      log(error.message ?? 'No Dio Msg', name: 'DioException Msg');

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.connectionError:
          return 'No internet connection. Please check your network.';

        case DioExceptionType.badResponse:
          final serverMsg = _extractServerMessage(error.response?.data);
          if (serverMsg != null) return serverMsg;

          return _getStatusCodeErrorMsg(error.response?.statusCode);

        case DioExceptionType.cancel:
          return 'Request was cancelled.';

        default:
          return ApiConstants.genericErrorMsg;
      }
    }

    return ApiConstants.genericErrorMsg;
  }

  static String? _extractServerMessage(dynamic data) {
    if (data is Map) {
      final msg = data['message'] ?? data['error'];
      if (msg is String && msg.trim().isNotEmpty) return msg;
    }
    return null;
  }

  static String _getStatusCodeErrorMsg(int? code) {
    switch (code) {
      case 400:
        return 'Invalid request. Please check your data.';
      case 401:
      case 403:
        return 'You are not authorized to do this.';
      case 404:
        return 'Not found.';
      case 500:
        return 'Server error. Please try again later.';
      default:
        return ApiConstants.genericErrorMsg;
    }
  }
}
