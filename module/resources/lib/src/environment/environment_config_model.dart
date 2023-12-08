import 'package:resources/src/enum/general_enum.dart';



class EnvironmentConfigModel {
  EnvironmentConfigModel({
    required this.environment,
    required this.apiBaseUrl,
    required this.socketUrl,
    required this.appName,
  });

  final AppEnvironment environment;
  final String appName;
  final String apiBaseUrl;
  final String socketUrl;
}
