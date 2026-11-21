import 'package:dio/dio.dart';
import 'package:examy_app/core/constants/api_constants.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_reponse.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @GET(ApiConstants.forgetPasswordEndpoint)
  Future<ForgetPasswordResponse> forgetPassword(@Query('email') String email);
}
