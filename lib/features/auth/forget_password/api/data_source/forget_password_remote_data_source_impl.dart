import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/api/api_client/api_client.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_body.dart';
import 'package:examy_app/features/auth/forget_password/data/models/reset_code_body.dart';
import 'package:injectable/injectable.dart';

import '../../data/data_source/forget_password_remote_data_source.dart';

@LazySingleton(as: ForgetPasswordRemoteDataSource)
class ForgetPasswordRemoteDataSourceImpl
    extends ForgetPasswordRemoteDataSource {
  final ForgetPasswordClient forgetPasswordClient;

  ForgetPasswordRemoteDataSourceImpl({required this.forgetPasswordClient});

  @override
  Future<BaseResponse<void>> forgetPassword(ForgetPasswordBody body) async {
    try {
      await forgetPasswordClient.forgetPassword(body);
      return SuccessBaseResponse(data: null);
    } catch (e) {
      return ErrorBaseResponse(errorObj: e);
    }
  }

  @override
  Future<BaseResponse<void>> verifyResetCode(ResetCodeBody code) async {
    try {
      await forgetPasswordClient.verifyResetCode(code);
      return SuccessBaseResponse(data: null);
    } catch (e) {
      return ErrorBaseResponse(errorObj: e);
    }
  }
}
