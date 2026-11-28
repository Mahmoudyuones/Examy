import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/sign_up/domain/entities/sign_up_parm.dart';

abstract class SignupRepo {
  Future<BaseResponse<void>> signUp(SignUpParm signUpParm);
}
