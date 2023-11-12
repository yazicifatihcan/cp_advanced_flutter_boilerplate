import 'package:flutter_base_project/app/data/local_models/domain/base_parse_model.dart';

class BaseErrorModel extends IBaseModel<BaseErrorModel> {
  BaseErrorModel({
    this.errorCode,
    this.message,
  });

  String? errorCode;
  String? message;

  @override
  fromJson(Map<String, dynamic> json) => BaseErrorModel(
        errorCode: json["error_code"],
        message: json["message"],
      );

  @override
  Map<String, dynamic> toJson() => {
        "error_code": errorCode,
        "message": message,
      };
}
