import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/login/domain/entities/login_request_entity.dart';
import 'package:examy_app/features/login/domain/repository/login_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  final LoginRepository _loginRepository;
  LoginUseCase(this._loginRepository);
  Future<BaseResponse<void>> call(LoginRequestEntity request) =>
      _loginRepository.login(request);
}
