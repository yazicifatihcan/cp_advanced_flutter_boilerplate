class BaseHttpModel<T> {

  BaseHttpModel({required this.status, this.data, this.error, this.errorCode});
  BaseModelStatus status;
  T? data;
  BaseErrorModel? error;
  String? errorCode;
}
