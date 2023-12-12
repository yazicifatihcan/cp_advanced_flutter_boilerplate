import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_base_project/product/init/i10n/lan/en.dart';
import 'package:flutter_base_project/product/init/i10n/lan/tr.dart';

/// Default Locale ayarlarımız
const Locale kDefaultLocal = Locale('tr');

/// Ugulamanın desteklediği diler
Map<String, AppLocalizationLabel> supportedLocalization = {
  'tr': TrLocalization(),
  'en': EnLocalization(),
};

///Function that returns all supported locales.
List<Locale> get getSupportedLocalList => List.generate(
      supportedLocalization.length,
      (int index) => Locale(
        supportedLocalization.keys.elementAt(index),
      ),
    );


///Abstrac class that keeps all texts.
abstract class AppLocalizationLabel {
  ///Abstrac class that keeps all texts.
  const AppLocalizationLabel();

  ///English
  String get localizationTitle;

  ///EN
  String get lanCode;

  ///An error occurred. Please try again later
  String get defaultErrorMessage;

  ///A server-related error occurred. Please try again later
  String get serverErrorMessage;

  ///Please check your internet connection.
  String get noInternetErrorMessage;

  ///You do not have the authority for this operation.
  String get unauthorizedErrorMessage;

  ///The connection has timed out
  String get timeoutErrorMessage;

  ///Cancel
  String get cancelBtnText;

  ///Try Again
  String get tryAgainBtnText;

  ///You should not be here :)
  String get unknownPageRouteMessageText;

}
