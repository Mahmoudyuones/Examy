import 'package:dio/dio.dart';
import 'package:examy_app/core/constants/app_endpoints.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_request.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_response.dart';
import 'package:examy_app/features/auth/forget_password/data/models/reset_code_request.dart';
import 'package:examy_app/features/auth/forget_password/data/models/reset_password_request.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ForgetPasswordClient {
  @factoryMethod
  factory ForgetPasswordClient(Dio dio) = _ForgetPasswordClient;

  @POST(AppEndpoints.forgetPasswordEndpoint)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest body,
  );

  @POST(AppEndpoints.verifyResetCode)
  Future<ForgetPasswordResponse> verifyResetCode(@Body() ResetCodeRequest body);

  @PUT(AppEndpoints.resetPasswordEndpoint)
  Future<ForgetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest body,
  );
}
