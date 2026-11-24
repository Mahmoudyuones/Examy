import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart';
import 'package:examy_app/features/auth/forget_password/data/models/reset_password_body.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/reset_password_entity.dart';
import 'package:examy_app/features/auth/forget_password/domain/repo/reset_password_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ResetPasswordRepo)
class ResetPasswordRepoImpl implements ResetPasswordRepo {
  final ForgetPasswordRemoteDataSource remoteDataSource;
  ResetPasswordRepoImpl(this.remoteDataSource);

  @override
  Future<BaseResponse<void>> resetPassword(ResetPasswordEntity entity) async {
    final resetPasswordBody = ResetPasswordBody(
      email: entity.email,
      newPassword: entity.newPassword,
    );
    final response = await remoteDataSource.resetPassword(resetPasswordBody);

    switch (response) {
      case SuccessBaseResponse():
        return SuccessBaseResponse(data: null);
      case ErrorBaseResponse error:
        return ErrorBaseResponse.fromErrorMsg(error.errMessage);
    }
  }
  // Implementation details
}
