import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/config/error_handler/error_handler.dart';
import 'package:examy_app/config/network/safe_api_call.dart';
import 'package:examy_app/config/services/token_service.dart';
import 'package:examy_app/features/sign_up/data/data_sources/signup_remote_data_source.dart';
import 'package:examy_app/features/sign_up/data/mappers/sign_up_request_mapper.dart';
import 'package:examy_app/features/sign_up/data/models/sign_up_response_model.dart';
import 'package:examy_app/features/sign_up/domain/entities/sign_up_parm.dart';
import 'package:examy_app/features/sign_up/domain/repositories/sign_up_repo.dart';

class SignupRepoImpl implements SignupRepo {
  final SignupRemoteDataSource _signupRemote;
  final TokenService _tokenService;

  SignupRepoImpl(this._signupRemote, this._tokenService);
  @override
  Future<BaseResponse<void>> signUp(SignUpParm signUpParm) async {
    final remoteResponse = await safeApiCall(
      () => _signupRemote.signUp(signUpParm.toModel()),
    );
    return remoteResponse.when(
      success: (SignupResponseModel data) {
        _tokenService.saveToken(data.token);
        return const BaseResponse<void>.success(null);
      },
      failure: (ErrorHandler error) {
        return BaseResponse<void>.failure(error);
      },
    );
  }
}
