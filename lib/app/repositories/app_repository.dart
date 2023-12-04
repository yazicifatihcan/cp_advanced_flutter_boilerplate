import 'package:get/get.dart';

import '../../../module/core/lib/src/http_client/dio_service.dart';
import '../../../module/models/lib/src/local_models/domain/session_header_model.dart';
import '../main/routing/routing_manager/routing_manager.dart';
import '../../../module/resources/lib/src/constants/http_url.dart';
import '../../../module/common/lib/src/managers/session_manager/session_manager.dart';
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