import 'package:examy_app/config/base_response/base_response.dart';
import 'package:examy_app/features/login/domain/entities/login_request_entity.dart';

abstract interface class LoginRepository {
  Future<BaseResponse<void>> login(LoginRequestEntity request);
}
