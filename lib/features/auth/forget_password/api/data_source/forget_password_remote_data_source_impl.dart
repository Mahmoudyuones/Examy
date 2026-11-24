import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/config/network/safe_api_call.dart';
import 'package:examy_app/features/auth/forget_password/api/api_client/api_client.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_body.dart';
import 'package:examy_app/features/auth/forget_password/data/models/reset_code_body.dart';
import 'package:examy_app/features/auth/forget_password/data/models/reset_password_body.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/forget_password_remote_data_source.dart';

@LazySingleton(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    implements ForgetPasswordRemoteDataSource {
  final ForgetPasswordClient forgetPasswordClient;

  ForgetPasswordRemoteDataSourceImpl({required this.forgetPasswordClient});

  @override
  Future<BaseResponse<void>> forgetPassword(ForgetPasswordBody body) async {
    return safeCallApi(() async {
      await forgetPasswordClient.forgetPassword(body);
    });
  }

  @override
  Future<BaseResponse<void>> verifyResetCode(ResetCodeBody code) async {
    return safeCallApi(() async {
      await forgetPasswordClient.verifyResetCode(code);
    });
  }

  @override
  Future<BaseResponse<void>> resetPassword(ResetPasswordBody body) async {
    return safeCallApi(() async {
      await forgetPasswordClient.resetPassword(body);
    });
  }
}
