import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/api/api_client/api_client.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_body.dart';

import '../../data/data_source/forget_password_remote_data_source.dart';

class ForgetPasswordRemoteDataSourceImpl
    extends ForgetPasswordRemoteDataSource {
  final RestClient restClient;

  ForgetPasswordRemoteDataSourceImpl({required this.restClient});

  @override
  Future<BaseResponse<void>> forgetPassword(ForgetPasswordBody body) async {
    try {
      await restClient.forgetPassword(body.email);
      return SuccessBaseResponse(data: null);
    } catch (e) {
      return ErrorBaseResponse.fromErrorMsg(
        'Failed to send password reset email: $e',
      );
    }
  }
}
