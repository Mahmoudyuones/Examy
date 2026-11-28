import 'package:examy_app/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:examy_app/features/sign_up/data/models/sign_up_response_model.dart';

abstract class SignupRemoteDataSource {
  Future<SignupResponseModel> signUp(SignUpRequestModel body);
}
