import 'package:flutter_base_project/app.dart';
import 'package:resources/resources.dart';

/// Development ortamı
///
/// COMMAND LINE örneği
/// flutter run --flavor development lib/app/main/main_development.dart
/// flutter build apk --release --flavor product lib/main_product.dart --no-tree-shake-icons
void main() {
  run(
    EnvironmentConfigModel(
      appName:'Dev App',
      environment: AppEnvironment.Development,
      apiBaseUrl: 'rickandmortyapi.com',
      socketUrl: 'Socket Url',
    ),
  );
}
 