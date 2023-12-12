import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/init/application_initialize.dart';
import 'package:flutter_base_project/product/init/i10n/default_localization.dart';
import 'package:flutter_base_project/product/init/i10n/i10n.dart';
import 'package:flutter_base_project/product/init/theme/themes/module_theme.dart';
import 'package:flutter_base_project/product/navigation/routing_manager.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// ignore: unused_import, depend_on_referenced_packages
import 'package:overlay_kit/overlay_kit.dart';
import 'package:resources/resources.dart';


///All environments call this function to run the app
Future<void> run(EnvironmentConfigModel config) async{
  await ApplicationInitialize().make(config);
  runApp(App(title: config.appName));
}

///Starting Widget of app
class App extends StatelessWidget {
  ///Starting Widget of app
  const App({
    required this.title,
    super.key,
  });
  ///Current title of the app that comes from [EnvironmentConfigModel]
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
                      data: MediaQuery.of(context).copyWith(
                      textScaler: TextScaler.noScaling,
                    ),
                      child: child!,
                    );
                  },
                  scrollBehavior: ScrollConfiguration.of(context).copyWith(
                  overscroll: false,
                ),
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
