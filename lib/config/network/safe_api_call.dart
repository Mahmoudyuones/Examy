import 'package:examy_app/config/base_response/base_response.dart';

Future<BaseResponse<T>> safeCallApi<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return SuccessBaseResponse(data: result);
  } catch (e) {
    return ErrorBaseResponse.fromErrorMsg(e.toString());
  }
}
