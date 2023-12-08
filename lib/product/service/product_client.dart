import 'package:api/api.dart';
import 'package:resources/resources.dart';

class ProductClient {
  
  ProductClient._init();
  late DioClient _dioClient;

  static final ProductClient _instance = ProductClient._init();

  static ProductClient get instance => _instance;

  static Future<void> clientInit(EnvironmentConfigModel config) async {
    instance._dioClient=DioClient.instance(
        baseUrl: config.apiBaseUrl,
        onUnauthorized: (){},
        headerParam: {},
    );
  }

  AuthRepository get authRepository => AuthRepository(dioClient: _dioClient);
}
