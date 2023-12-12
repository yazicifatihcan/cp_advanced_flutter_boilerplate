import 'package:api/src/index.dart';

///Extension to generically send request and handle error
extension BaseRequestExtension<T> on Future<BaseHttpModel<T>> {

  ///Extension to generically send request and handle error
  Future<T> getAllData({String? defaultErrorMessage}) async {
    final response = await this;
    if (response.status.isOk) {
      return response.data as T;
    } else {
      throw AppException(response.error?.message ?? defaultErrorMessage);
    }
  }
}
