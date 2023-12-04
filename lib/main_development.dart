import '../module/models/lib/src/local_models/config/environment_config_model.dart';

import 'app.dart';
import '../module/resources/lib/src/enum/general_enum.dart';

/// Development ortamı
///
/// COMMAND LINE örneği
/// flutter run --flavor development lib/main_development.dart
/// flutter build appbundle --release --flavor development lib/main_development.dart
void main() {
  run(
    EnvironmentConfigModel(
      app:const App(title: 'ClaudePeak Boilerplate Dev'),
      environment: AppEnvironment.Development,
      apiBaseUrl: 'rickandmortyapi.com',
      socketUrl: 'Socket Url',
    ),
  );
}
 