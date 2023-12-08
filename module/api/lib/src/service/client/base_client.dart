import 'dart:convert';
import 'dart:io';
import 'package:api/src/index.dart';
import 'package:dio/dio.dart';

abstract class BaseClient {
  final DioClient dio;

  BaseClient({
    required this.dio,
  });


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
      return BaseHttpModel(status: BaseModelStatus.fromValue(e.response?.statusCode), error: errorModel);
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.Error);
    }
  }
}
