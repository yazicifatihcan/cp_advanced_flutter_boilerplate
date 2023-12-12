import 'dart:ui';

import 'package:common/common.dart';
import 'package:rxdart/rxdart.dart';


///This class is created for managing states that is valid for whole app.
class AppStateController {
  AppStateController._();
  static final AppStateController _instance = AppStateController._();

  ///This method returns instance for [AppStateController]
  static AppStateController get instance => _instance;

  ///This class has values that represent states for app.
  late AppStateModel model;

  ///Current available color palettes for app.
  late List<AbstractColor> availableColorPalettes;

  ///Current selected lan code for current user.
  late String? currentLanCode;
  ///Current selected theme color code for current user.
  late String? currentThemeColorCode;
  

  final LocaleManager _localeManager = LocaleManager.instance;


  late final BehaviorSubject<AppStateModel> _model = BehaviorSubject.seeded(
    initialData(),
  );

  ///Returns app state model as  stream to refresh the app when needed.
  Stream<AppStateModel> get outModel => _model;



  ///Initializes the required values for [AppStateController].
  ///You have to initialize [AppStateController] before using any
  ///of its functioanlity.
  static Future<void> init({
    required List<AbstractColor> colorPalettes,
    String? lanCode,
    String? colorCode,
  }) async {
    _instance.availableColorPalettes = colorPalettes;
    _instance.currentLanCode = lanCode;
    _instance.currentThemeColorCode = colorCode;
  }


  AbstractColor _initTheme() {
    if (currentThemeColorCode == null) {
      final isPlatformDark =
          PlatformDispatcher.instance.platformBrightness == Brightness.dark;

      return availableColorPalettes.firstWhere(
        (element) =>
            element.brightness ==
            (isPlatformDark ? Brightness.dark : Brightness.light),
        orElse: () => availableColorPalettes.first,
      );
    } else {
      return availableColorPalettes.firstWhere(
        (element) => element.themeCode == currentThemeColorCode,
        orElse: () => availableColorPalettes.first,
      );
    }
  }

  Locale _initLocale() {
    if (currentLanCode == null) {
      return const Locale('tr');
    } else {
      return Locale(currentLanCode!);
    }
  }


  ///Initial data for materialController
  AppStateModel initialData() => model = AppStateModel(
        locale: _initLocale(),
        themeData: _initTheme(),
      );
  

  ///Sets the Theme, saves it to locale and updates the stream.
  void setTheme(
      {required String cacheKey, required AbstractColor colorPalette,}) {
    _localeManager.setStringValue(key: cacheKey, value: colorPalette.themeCode);
    _model.add(model.copyWith(themeData: colorPalette));
  }

  ///Sets the Locale, saves it to locale and updates the stream.
  void setLocale(
    String cacheKey,
    String lanCode,
  ) {
    _localeManager.setStringValue(key: cacheKey, value: lanCode);
    _model.add(
      model.copyWith(locale: Locale(lanCode)),
    );
  }
}
