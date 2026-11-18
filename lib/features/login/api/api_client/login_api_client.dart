import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../login/data/models/login_reponse_model.dart';
import '../../../login/data/models/login_request_model.dart';

part 'login_api_client.g.dart';

@RestApi()
@injectable
abstract class LoginApiClient {
  @factoryMethod
  factory LoginApiClient(Dio dio) = _LoginApiClient;

  @POST(ApiConstants.loginEndPoint)
  Future<LoginResponseModel> login(@Body() LoginRequestModel body);
}
