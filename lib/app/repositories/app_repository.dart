import 'package:flutter_base_project/app/main/routing/routing_manager/routing_manager.dart';
import 'package:get/get.dart';

import '../../core/http_client/dio_service.dart';
import '../data/local_models/domain/session_header_model.dart';
import '../main/values/constants/http_url.dart';
import '../managers/session_manager/session_manager.dart';
import 'modules/auth_repository.dart';

class AppRepository extends SessionHeaderModel {
   AppRepository() : super(token: Get.find<SessionManager>().getUserToken() ?? '') {
    _dioClient.headerParam?.clear();
    _dioClient.headerParam?.addAll(createHeader());
  }

  DioClient get _dioClient => DioClient.instance(
        baseUrl: HttpUrl.baseUrl,
        headerParam: createHeader(),
        onUnauthorized: (){
         Get.find<SessionManager>().logOut();
         RoutingManager.instance.restartApp();
        },
      );

  AuthRepository get authRepository {
    final dio = _dioClient;
    return AuthRepository(dio: dio);
  }

  
}