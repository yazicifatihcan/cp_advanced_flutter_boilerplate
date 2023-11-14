import 'package:get/get.dart';

import '../../core/http_client/dio_service.dart';
import '../data/local_models/domain/session_header_model.dart';
import '../main/routing/routing_manager/routing_manager.dart';
import '../main/values/constants/http_url.dart';
import '../managers/session_manager/session_manager.dart';
import 'modules/auth_repository.dart';

class AppRepository extends SessionHeaderModel {
  late final DioClient _dioClient;

  AppRepository() : super(token: Get.find<SessionManager>().getUserToken() ?? '') {
    _dioClient = DioClient.instance(
      baseUrl: HttpUrl.baseUrl,
      headerParam: createHeader(),
      onUnauthorized: () {
        Get.find<SessionManager>().logOut();
        RoutingManager.instance.restartApp();
      },
    );
    _dioClient.headerParam?.clear();
    _dioClient.headerParam?.addAll(createHeader());
  }

  AuthRepository get authRepository {
    return AuthRepository(dio: _dioClient);
  }
}