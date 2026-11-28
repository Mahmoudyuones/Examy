import 'package:examy_app/features/sign_up/api/api_client/api_client.dart';
import 'package:examy_app/features/sign_up/data/data_sources/signup_remote_data_source.dart';
import 'package:examy_app/features/sign_up/data/models/sign_up_request_model.dart';
import 'package:examy_app/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SignupRemoteDataSource)
class SignupRemoteDataSourceImpl implements SignupRemoteDataSource {
  final SignupApiClient signupApiClient;

  SignupRemoteDataSourceImpl(this.signupApiClient);

  @override
  Future<SignupResponseModel> signUp(SignUpRequestModel body) =>
      signupApiClient.signUp(body);
}
