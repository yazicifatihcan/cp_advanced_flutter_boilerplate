import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_base_project/app/data/local_models/domain/base_error_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../../core/http_client/dio_service.dart';
import '../data/local_models/domain/base_http_model.dart';
import '../data/local_models/domain/base_parse_model.dart';
import '../main/values/enum/loading_status_enum.dart';
import '../managers/session_manager/session_manager.dart';

abstract class BaseRepository {
  final DioClient dio;

  BaseRepository({
    required this.dio,
  });

  SessionManager get sessionManager => Get.find();

  Future<BaseHttpModel<T>> baseRequest<T extends IBaseModel?>({
    IBaseModel? requestModel,
    IBaseModel? responseModel,
    required String httpUrl,
    required DioHttpMethod method,
    Map<String, dynamic>? queryParams,
    Map<String, String>? headerParam,
    int? successStatus,
  }) async {
    try {
      final response = await dio.request(
        method,
        httpUrl,
        bodyParam: requestModel?.toJson() ?? {},
        queryParams: queryParams,
        headerParam: headerParam, 
      );
      if (response!.statusCode == (successStatus ?? HttpStatus.ok)) {
        T? returnResponse;
        if (responseModel!=null) {
          returnResponse = responseModel.jsonParser(jsonEncode(response.data));
        }
        return BaseHttpModel(status: BaseModelStatus.Ok, data: returnResponse==null ? null : returnResponse as T);
      } else {
        final BaseErrorModel errorModel = BaseErrorModel().jsonParser(jsonEncode(response.data));
        return BaseHttpModel(status: BaseModelStatus.Error, error: errorModel);
      }
    } on DioException catch (e) {
      final BaseErrorModel errorModel = BaseErrorModel().jsonParser(jsonEncode(e.response?.data));
      return BaseHttpModel(status: BaseModelStatus.Error, error: errorModel);
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }
}
