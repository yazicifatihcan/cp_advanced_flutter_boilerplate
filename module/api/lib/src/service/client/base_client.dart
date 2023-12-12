import 'dart:convert';
import 'dart:io';
import 'package:api/src/index.dart';
import 'package:dio/dio.dart';

///Base Client that handles all kind of request using [DioClient]
abstract class BaseClient {
  ///Base Client constructors.
  BaseClient({
    required this.dio,
  });

  ///Dio instance within BaseClient
  final DioClient dio;

  ///Base request that handles
  Future<BaseHttpModel<T>> baseRequest<T extends IBaseModel<T>?>({
    required String httpUrl,
    required DioHttpMethod method,
    IBaseModel<T>? requestModel,
    IBaseModel<T>? responseModel,
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
        if (responseModel != null) {
          returnResponse =
              responseModel.jsonParser(jsonEncode(response.data)) as T;
        }
        return BaseHttpModel(
            status: BaseModelStatus.ok,
            data: returnResponse == null ? null : returnResponse as T,);
      } else {
        final errorModel = BaseErrorModel()
            .jsonParser(jsonEncode(response.data)) as BaseErrorModel;
        return BaseHttpModel(status: BaseModelStatus.error, error: errorModel);
      }
    } on DioException catch (e) {
      final errorModel = BaseErrorModel()
          .jsonParser(jsonEncode(e.response?.data)) as BaseErrorModel;
      return BaseHttpModel(
        status: BaseModelStatus.fromValue(e.response?.statusCode),
        error: errorModel,
      );
    } catch (e) {
      return BaseHttpModel(status: BaseModelStatus.error);
    }
  }
}
