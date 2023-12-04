import '../exception/app_exception.dart';


extension BaseRequestExtension<T> on Future<BaseHttpModel<T>> {
  
  Future<T> getAllData() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await this;
    if (response.status.isOk) {
      return response.data as T;
    } else {
      throw AppException(response.error?.message ?? AppLocalization.getLabels.defaultErrorMessage);
    }
  }
}

