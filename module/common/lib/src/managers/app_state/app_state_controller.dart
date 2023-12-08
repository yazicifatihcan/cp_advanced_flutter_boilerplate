import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';


class AppStateController {
  AppStateController._();
  static final AppStateController _instance = AppStateController._();
  static AppStateController get instance => _instance;
  late AppStateModel model;


  late List<AbstractColor> availableColorPalettes;
  late String? currentLanCode;
  late String? currentThemeColorCode;
  

  LocaleManager localeManager = LocaleManager.instance;


  late final BehaviorSubject<AppStateModel> _model = BehaviorSubject.seeded(initialData());

  Stream<AppStateModel> get outModel => _model;



  static Future<void> init({required List<AbstractColor> colorPalettes,String? lanCode,String? colorCode})async{
    _instance.availableColorPalettes=colorPalettes;
    _instance.currentLanCode=lanCode;
    _instance.currentThemeColorCode=colorCode;
  }


  AbstractColor _initTheme() {
    if (currentThemeColorCode == null) {
      final bool isPlatformDark = WidgetsBinding.instance.window.platformBrightness == Brightness.dark;
      return availableColorPalettes.firstWhere((element) => element.brightness==(isPlatformDark ? Brightness.dark : Brightness.light),orElse: ()=>availableColorPalettes.first) ;
    } else {
      return availableColorPalettes.firstWhere((element) => element.themeCode==currentThemeColorCode,orElse:()=>availableColorPalettes.first);
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
  AppStateModel initialData() {
    model = AppStateModel(locale: _initLocale(), themeData: _initTheme());
    return model;
  }

  ///Set Theme Function.
  void setTheme(String cacheKey,AbstractColor colorPalette) {
    localeManager.setStringValue(cacheKey, colorPalette.themeCode);
    _model.add(model.copyWith(themeData: colorPalette));
  }

  ///Set localization code function
  void setLocale(
    String cacheKey,
    String lanCode,
  ) {
    localeManager.setStringValue(cacheKey, lanCode);
    _model.add(
      model.copyWith(locale: Locale(lanCode)),
    );
  }
}
