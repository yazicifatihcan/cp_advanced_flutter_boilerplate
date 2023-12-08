import 'package:common/common.dart';
import 'package:flutter/material.dart';

class AppStateModel {

  AppStateModel({required this.locale, required this.themeData});
  
  final Locale locale;
  final AbstractColor themeData;

  AppStateModel copyWith({
    final Locale? locale,
    final AbstractColor? themeData,
  }) =>
      AppStateModel(locale: locale ?? this.locale, themeData: themeData ?? this.themeData);
}
