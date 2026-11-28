import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/sign_up/domain/entities/sign_up_parm.dart';
import 'package:examy_app/features/sign_up/domain/repositories/sign_up_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUsecase {
  final SignupRepo _signupRepo;

  SignupUsecase({required this._signupRepo});
  Future<BaseResponse<void>> call(SignUpParm signUpParm) =>
      _signupRepo.signUp(signUpParm);
}
