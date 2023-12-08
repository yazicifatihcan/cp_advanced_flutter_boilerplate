import 'package:api/src/index.dart';

class BaseHttpModel<T> {

  BaseHttpModel({required this.status, this.data, this.error, this.errorCode});
  BaseModelStatus status;
  T? data;
  BaseErrorModel? error;
  String? errorCode;
}

enum BaseModelStatus {
  /// 200 - OK
  Ok(200),
  
  /// 400 - Bad Request
  Error(400),
  
  /// 200 - Action Completed Successfully
  Action(200),
  
  /// 422 - Unprocessable Entity
  UnprocessableEntity(422),

  /// 422 - Unprocessable Entity
  InternalServerError(500),
  
  /// 408 - Request Timeout
  Timeout(408),
  
  /// 404 - Not Found
  NotFound(404),
  
  /// 302 - Found (Redirect)
  Found(302);
  
  final int value;
  
  const BaseModelStatus(this.value);

  static BaseModelStatus fromValue(int? value) {
    if(value==null) return BaseModelStatus.Error;
    return BaseModelStatus.values.firstWhere((element) => element.value == value,
        orElse: () => BaseModelStatus.Error);
  }
}


extension BaseModelStatusExtension on BaseModelStatus {
  bool get isOk => this == BaseModelStatus.Ok;

  bool get isAction => this == BaseModelStatus.Action;

  bool get isError => this == BaseModelStatus.Error;

  bool get isUnprocessableEntity => this == BaseModelStatus.UnprocessableEntity;

  bool get isTimeOut => this == BaseModelStatus.Timeout;

  bool get isNotFound => this == BaseModelStatus.NotFound;

  bool get isFound => this == BaseModelStatus.Found;
}