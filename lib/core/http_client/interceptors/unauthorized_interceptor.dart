import 'package:dio/dio.dart';


class UnauthorizedInterceptor extends Interceptor {

  final Function? onUnauthorized;

  UnauthorizedInterceptor({this.onUnauthorized,});

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async{
    await onUnauthorized?.call();
    super.onError(err, handler);
  }
}
