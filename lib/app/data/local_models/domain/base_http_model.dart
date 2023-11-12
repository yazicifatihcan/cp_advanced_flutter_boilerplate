import 'package:flutter_base_project/app/data/local_models/domain/base_error_model.dart';

import '../../../main/values/enum/loading_status_enum.dart';

class BaseHttpModel<T> {

  BaseHttpModel({required this.status, this.data, this.error, this.errorCode});
  BaseModelStatus status;
  T? data;
  BaseErrorModel? error;
  String? errorCode;
}
