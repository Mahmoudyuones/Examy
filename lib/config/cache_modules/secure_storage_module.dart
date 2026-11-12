import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../base_response/base_response.dart';
import '../error_handler/error_handler.dart';
import '../error_handler/local_exception.dart';
import '../../core/constants/cache_constants.dart';

@singleton
class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService()
    : _storage = const FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );

  Future<BaseResponse<String?>> read(String key) async {
    try {
      final value = await _storage.read(key: key);
      return BaseResponse.success(value);
    } catch (e) {
      return BaseResponse.failure(
        ErrorHandler.handle(CacheError('Failed to read "$key": $e')),
      );
    }
  }

  Future<BaseResponse<bool>> write(String key, String value) async {
    try {
      await _storage.write(key: key, value: value);
      return const BaseResponse.success(true);
    } catch (e) {
      return BaseResponse.failure(
        ErrorHandler.handle(CacheError('Failed to write "$key": $e')),
      );
    }
  }

  Future<BaseResponse<bool>> delete(String key) async {
    try {
      await _storage.delete(key: key);
      return const BaseResponse.success(true);
    } catch (e) {
      return BaseResponse.failure(
        ErrorHandler.handle(CacheError('Failed to delete "$key": $e')),
      );
    }
  }

  Future<BaseResponse<bool?>> readBool(String key) async {
    final result = await read(key);
    return result.when(
      success: (value) {
        if (value == null) return const BaseResponse.success(null);
        return BaseResponse.success(value == 'true');
      },
      failure: (error) => BaseResponse.failure(error),
    );
  }

  Future<BaseResponse<bool>> writeBool(String key, bool value) async {
    return write(key, value.toString());
  }

  Future<BaseResponse<Map<String, dynamic>?>> readJson(String key) async {
    final result = await read(key);
    return result.when(
      success: (value) {
        if (value == null) return const BaseResponse.success(null);
        try {
          final json = jsonDecode(value) as Map<String, dynamic>;
          return BaseResponse.success(json);
        } catch (e) {
          return BaseResponse.failure(
            ErrorHandler.handle(
              CacheError('Failed to decode JSON for "$key": $e'),
            ),
          );
        }
      },
      failure: (error) => BaseResponse.failure(error),
    );
  }

  Future<BaseResponse<bool>> writeJson(
    String key,
    Map<String, dynamic> value,
  ) async {
    try {
      return await write(key, jsonEncode(value));
    } catch (e) {
      return BaseResponse.failure(
        ErrorHandler.handle(
          CacheError('Failed to encode JSON for "$key": $e'),
        ),
      );
    }
  }

  Future<BaseResponse<String?>> getAuthTokens() async {
    return read(StorageKeys.accessToken);
  }

  Future<BaseResponse<bool>> saveAuthTokens({
    required String accessToken,
  }) async {
    return write(StorageKeys.accessToken, accessToken);
  }

  Future<BaseResponse<bool>> clearAuthTokens() async {
    return delete(StorageKeys.accessToken);
  }
}

