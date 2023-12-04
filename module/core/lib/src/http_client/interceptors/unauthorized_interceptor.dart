import 'dart:io';

import 'package:dio/dio.dart';


class UnauthorizedInterceptor extends Interceptor {

  final Function? onUnauthorized;

  UnauthorizedInterceptor({this.onUnauthorized,});

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async{
    if(err.response?.statusCode==HttpStatus.unauthorized){
      await onUnauthorized?.call();
    }
    super.onError(err, handler);
  }
}
