import 'package:dio/dio.dart';
import 'package:examy_app/core/constants/api_constants.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_reponse.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi()
abstract class ForgetPasswordClient {
  @factoryMethod
  factory ForgetPasswordClient(Dio dio) = _ForgetPasswordClient;

  @POST(ApiConstants.forgetPasswordEndpoint)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() Map<String, dynamic> body,
  );
}
