import 'package:flutter/material.dart';
import '../module/models/lib/src/local_models/config/environment_config_model.dart';
import 'package:flutter_base_project/app/main/routing/routing_manager/routing_manager.dart';
import 'package:resources/src/theme/color/app_colors.dart';
import 'package:resources/src/theme/theme.dart';
import 'package:resources/src/theme/themes/app_dark_theme.dart';
import 'package:resources/src/constants/http_url.dart';
import 'package:common/src/managers/app_managers/app_state/app_state_controller.dart';
import 'package:common/src/managers/app_managers/app_state/app_state_stream_builder.dart';
import 'package:common/src/managers/app_managers/size_config.dart';
import 'package:common/src/managers/locale_manager/locale_manager.dart';
import '../module/core/lib/src/i10n/default_localization.dart';
import '../module/core/lib/src/i10n/i10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:overlay_kit/overlay_kit.dart';


Future<void> run(EnvironmentConfigModel config) async{
  HttpUrl.baseUrl = config.apiBaseUrl;
  WidgetsFlutterBinding.ensureInitialized();
  await LocaleManager.cacheInit();

  runApp.call(config.app);
}

class App extends StatelessWidget {
  ///
  const App({
    super.key,
    required this.title,
  });

  ///
  final String title;

  @override
  Widget build(BuildContext context) {
    return OverlayKit(
      appPrimaryColor: AppColors.primary,
      child: MaterialRxStreamBuilder(
          stream: AppStateController.instance.outModel,
          builder: (_, snapshot) {
            final model = snapshot.data;
            return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                SizeConfig.setScreenSizeFromConstraints(constraints);
                return MaterialApp.router(
                  routerConfig: RoutingManager.instance.router,
                  locale: model!.locale,
                  supportedLocales: getSupportedLocalList,
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    AppLocalization.delegate
                  ],
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
                      child: child!,
                    );
                  },
                  scrollBehavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
                  title: title,
                  debugShowCheckedModeBanner: false,
                  theme: model.themeData,
                  darkTheme: getTheme(AppDarkTheme()),
                );
              },
            );
          }),
    );
  }
}
