import 'package:api/api.dart';
import 'package:resources/resources.dart';


/// Client for handling module specific repositories
class ProductClient {
  
  ProductClient._init();
  late DioClient _dioClient;

  static final ProductClient _instance = ProductClient._init();

  /// Instance for [ProductClient]
  static ProductClient get instance => _instance;

  /// This method needs to be called before using [ProductClient].
  /// Call to init.
  static Future<void> clientInit(EnvironmentConfigModel config) async {
    instance._dioClient=DioClient(
        baseUrl: config.apiBaseUrl,
        onUnauthorized: (){},
        headerParam: {},
    );
  }

  /// Repository that contains Auth Related API calls
  AuthRepository get authRepository => AuthRepository(dioClient: _dioClient);
}
