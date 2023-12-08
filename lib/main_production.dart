import 'package:flutter_base_project/app.dart';
import 'package:resources/resources.dart';


/// flutter run --flavor product lib/app/main/main_production.dart
/// flutter build apk --release --flavor product lib/app/main/main_production.dart
/// flutter build appbundle --release --flavor product lib/app/main/main_production.dart

void main() {
  run(
    EnvironmentConfigModel(
      appName:'Prod App',
      environment: AppEnvironment.Production,
      apiBaseUrl: 'rickandmortyapi.com',
      socketUrl: 'Socket Url',
    ),
  );
}

