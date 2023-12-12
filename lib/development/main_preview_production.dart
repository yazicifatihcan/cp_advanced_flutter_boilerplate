import 'package:flutter_base_project/development/preview_app.dart';
import 'package:resources/resources.dart';

void main() {
  runPreview(
    EnvironmentConfigModel(
      appName: 'Dev App',
      environment: AppEnvironment.development,
      apiBaseUrl: 'rickandmortyapi.com',
      socketUrl: 'Socket Url',
    ),
  );
}
