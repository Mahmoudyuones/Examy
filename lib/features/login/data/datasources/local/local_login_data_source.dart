import 'package:examy_app/config/base_response/base_response.dart';

abstract interface class LocalLoginDataSource {
  Future<BaseResponse<bool>> cacheUserToken({required String token});
}
