import 'package:dio/dio.dart';
import 'package:examy_app/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:examy_app/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:examy_app/core/constants/api_constants.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class SignupApiClient {
  @factoryMethod
  factory SignupApiClient(Dio dio) = _SignupApiClient;

  @POST(ApiConstants.signUpEndpoint)
  Future<SignupResponseModel> signUp(@Body() SignUpRequestModel body);
}
