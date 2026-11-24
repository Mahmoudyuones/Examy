import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/auth/forget_password/data/data_source/forget_password_remote_data_source.dart';
import 'package:examy_app/features/auth/forget_password/data/models/forget_password_body.dart';
import 'package:examy_app/features/auth/forget_password/domain/entities/forget_password_entity.dart';
import 'package:examy_app/features/auth/forget_password/domain/repo/forget_password_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ForgetPasswordRepo)
class ForgetPasswordRepoImpl implements ForgetPasswordRepo {
  final ForgetPasswordRemoteDataSource remoteDataSource;
  ForgetPasswordRepoImpl({required this.remoteDataSource});

  @override
  Future<BaseResponse<void>> forgetPassword(ForgetPasswordEntity entity) async {
    final body = ForgetPasswordBody(email: entity.email);
    switch (await remoteDataSource.forgetPassword(body)) {
      case SuccessBaseResponse():
        return SuccessBaseResponse(data: null);
      case ErrorBaseResponse error:
        return ErrorBaseResponse.fromErrorMsg(error.errMessage);
    }
  }
}
