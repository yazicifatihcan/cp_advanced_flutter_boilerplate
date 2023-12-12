import 'package:flutter_base_project/development/preview_app.dart';
import 'package:resources/resources.dart';

void main() {
  runPreview(
    EnvironmentConfigModel(
      appName: 'Prod App',
      environment: AppEnvironment.production,
      apiBaseUrl: 'rickandmortyapi.com',
      socketUrl: 'Socket Url',
    ),
  );
}
