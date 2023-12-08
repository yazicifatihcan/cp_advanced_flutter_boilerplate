import 'package:api/src/index.dart';

extension BaseRequestExtension<T> on Future<BaseHttpModel<T>> {
  
  Future<T> getAllData({String? defaultErrorMessage}) async {
    final response = await this;
    if (response.status.isOk) {
      return response.data as T;
    } else {
      throw AppException(response.error?.message ?? defaultErrorMessage);
    }
  }
}

