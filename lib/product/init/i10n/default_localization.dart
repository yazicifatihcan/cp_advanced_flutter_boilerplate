import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Locale;
import 'package:flutter_base_project/product/init/i10n/lan/en.dart';
import 'package:flutter_base_project/product/init/i10n/lan/tr.dart';

/// Default Locale ayarlarımız
const Locale kDefaultLocal = Locale('tr');

/// Ugulamanın desteklediği diler
const Map<String, AppLocalizationLabel> supportedLocalization = {
  'tr': TrLocalization(),
  'en': EnLocalization(),
};

List<Locale> get getSupportedLocalList => List.generate(
      supportedLocalization.length,
      (int index) => Locale(
        supportedLocalization.keys.elementAt(index),
      ),
    );



abstract class AppLocalizationLabel {
  const AppLocalizationLabel();

  String get localizationTitle;

  String get lanCode;




  /// Error Text
  String get defaultErrorMessage;

  String get serverErrorMessage;

  String get noInternetErrorMessage;

  String get unauthorizedErrorMessage;

  String get timeoutErrorMessage;

  /// Button Text

  String get cancelBtnText;

  String get tryAgainBtnText;

  /// Regex
  String get enterEmailAddressReqExMessage;

  String get enterValidEmailReqExMessage;

  String get enterTelNoReqExMessage;

  String get enterValidTelNoReqExMessage;

  String get enterValidCodeReqExMessage;

  String get enterNameReqExMessage;

  String get enterValidNameReqExMessage;

  String get enterSurnameReqExMessage;

  String get enterValidSurnameReqExMessage;

  String get requiredFieldReqExMessage;

  String get enterValidCardNoReqExMessage;

  String get enterValidDatReqExMessage;

  String get enterValidPasswordReqExMessage;

  String get unknownPageRouteMessageText;

}
