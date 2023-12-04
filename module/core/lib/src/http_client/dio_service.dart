import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'interceptors/index.dart';

// Enum to define HTTP methods
enum DioHttpMethod { GET, POST, PUT, DELETE, PATCH, UPDATE }

// DioClient class for handling API requests
class DioClient {
  static DioClient? _instance; // Singleton instance of DioClient
  final String baseUrl; // Base URL of the API
  final Map<String, dynamic>? headerParam; // Token for authorization
  final Dio _dio; // Dio instance for making HTTP requests
  final logger = Logger(); // Logger for logging requests and responses

  // Singleton instance method for DioClient
  static DioClient instance({
    required String baseUrl,
    Function? onUnauthorized,
    Map<String, dynamic>? headerParam,
    int connectTimeoutSecond = 15,
    int receiveTimeoutSecond = 15,
  }) {
    _instance ??= DioClient._internal(
      baseUrl: baseUrl,
      onUnauthorized: onUnauthorized,
      headerParam: headerParam,
      connectTimeout: connectTimeoutSecond,
      receiveTimeout: receiveTimeoutSecond,
    );
    return _instance!;
  }

  // Private constructor for DioClient
  DioClient._internal({
    required this.baseUrl,
    Function? onUnauthorized,
    this.headerParam,
    required int connectTimeout,
    required int receiveTimeout,
  })
      : _dio = Dio(
          BaseOptions(
            baseUrl: Uri.https(baseUrl).toString(),
            headers: headerParam,
            connectTimeout: Duration(seconds: connectTimeout),
            receiveTimeout: Duration(seconds: receiveTimeout),
          ),
        ) {
    addInterceptors(onUnauthorized: onUnauthorized);
  }


  // Method to add interceptors for logging requests and responses
  void addInterceptors({Function? onUnauthorized}) {
    final _prettyDioLogger = PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 150,
        );
    final _unAuthorizedInterceptor = UnauthorizedInterceptor(onUnauthorized: onUnauthorized);


    _dio.interceptors.add(_prettyDioLogger);
    _dio.interceptors.add(_unAuthorizedInterceptor);
  }


  Options _options(Map<String, dynamic>? customHeaderParams) {
    Map<String, dynamic> headers = {};
    headers.addAll(customHeaderParams ?? {});
    headers.addAll(headerParam ?? {});
    return Options(headers: headers);
  }

  // Method to send HTTP requests based on the specified method
  Future<Response?> _sendRequest(
    DioHttpMethod method,
    String pathBody,
    Object bodyParam,
    Map<String, String>? customHeaderParams,
    Map<String, dynamic>? queryParams,
  ) async {
    var uri = Uri.https(baseUrl, (pathBody.isNotEmpty ? pathBody : ''), queryParams);
    try {
      Response response;
      switch (method) {
        case DioHttpMethod.GET:
          response = await _dio.getUri(uri, data: bodyParam, options: _options(customHeaderParams));
          break;
        case DioHttpMethod.POST:
          response = await _dio.postUri(uri, data: bodyParam, options: _options(customHeaderParams));
          break;
        case DioHttpMethod.DELETE:
          response = await _dio.deleteUri(uri, data: bodyParam, options: _options(customHeaderParams));
          break;
        case DioHttpMethod.PUT:
          response = await _dio.putUri(uri, data: bodyParam, options: _options(customHeaderParams));
          break;
        case DioHttpMethod.PATCH:
          response = await _dio.patchUri(uri, data: bodyParam, options: _options(customHeaderParams));
          break;
        default:
          throw Exception('Method not found.');
      }
      return response;
    } on DioException catch (_) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }


  Future<Response?> request(DioHttpMethod method, String path,
      {Object bodyParam = const {},
      Map<String, String>? headerParam,
      bool? forceRefresh,
      Map<String, dynamic>? queryParams}) async {
    return await _sendRequest(
      method,
      path,
      bodyParam,
      headerParam,
      queryParams,
    );
  }
}