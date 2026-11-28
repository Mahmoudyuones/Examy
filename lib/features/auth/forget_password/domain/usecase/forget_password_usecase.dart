import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:examy_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUsecase {
  final ForgetPasswordRepo _forgetPasswordRepo;
  ForgetPasswordUsecase({required this._forgetPasswordRepo});

  Future<BaseResponse<void>> forgetPassword(String email) async {
    final entity = ForgetPasswordEntity(email: email);
    return await _forgetPasswordRepo.forgetPassword(entity);
  }
}
