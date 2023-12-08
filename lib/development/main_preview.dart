import 'package:common/common.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/init/application_initialize.dart';
import 'package:flutter_base_project/product/init/i10n/default_localization.dart';
import 'package:flutter_base_project/product/init/i10n/i10n.dart';
import 'package:flutter_base_project/product/init/theme/themes/module_theme.dart';
import 'package:flutter_base_project/product/navigation/routing_manager.dart';
import 'package:flutter_base_project/product/utility/values/app_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:resources/resources.dart';

Future<void> main() async {
  final config = EnvironmentConfigModel(
      appName:'Dev App',
      environment: AppEnvironment.Development,
      apiBaseUrl: 'rickandmortyapi.com',
      socketUrl: 'Socket Url',
    );
  await ApplicationInitialize().make(config);
  runApp(
    DevicePreview(
      builder: (context) =>App(title: config.appName),
    ),
  );
}


class App extends StatelessWidget {
  const App({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return OverlayKit(
      child: MaterialRxStreamBuilder(
          stream: AppStateController.instance.outModel,
          builder: (_, snapshot) {
            final model = snapshot.data;
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                SizeConfig.setScreenSizeFromConstraints(
                  constraints: constraints,
                  designScreenHeight: designHeight,
                  designScreenWidth: designWidth,
                );
                return MaterialApp.router(
                  routerConfig: RoutingManager.instance.router,
                  locale: model!.locale,
                  supportedLocales: getSupportedLocalList,
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    AppLocalization.delegate,
                  ],
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1)),
                      child: child!,
                    );
                  },
                  scrollBehavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
                  title: title,
                  debugShowCheckedModeBanner: false,
                  theme: getTheme(ModuleTheme(appColors: model.themeData)),
                );
              },
            );
          },),
    );
  }
}