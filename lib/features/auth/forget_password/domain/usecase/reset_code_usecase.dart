import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/reset_code_entity.dart';
import 'package:examy_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:examy_app/features/auth/forget_password/domain/repo/reset_code_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetCodeUsecase {
  final ResetCodeRepo resetCodeRepo;
  ResetCodeUsecase({required this.resetCodeRepo});
  Future<BaseResponse<void>> verifyResetCode(String code) async {
    final entity = ResetCodeEntity(code: code);

    return await resetCodeRepo.verifyResetCode(entity);
  }
}
