import 'package:flutter/material.dart';

abstract class AppTheme {


  String get fontFamily;
  
  IconThemeData get accentIconTheme;

  IconThemeData get primaryIconTheme;

  IconThemeData get iconTheme;

  ColorScheme get colorScheme;

  CardTheme get cardTheme;

  TextTheme get textTheme;

  ElevatedButtonThemeData get elevatedButtonTheme;

  InputDecorationTheme get inputDecorationTheme;

  TextSelectionThemeData get textSelectionThemeData;

  TextButtonThemeData get textButtonThemeData;

  OutlinedButtonThemeData get outlinedButtonThemeData;

  CheckboxThemeData get checkboxThemeData;

  RadioThemeData get radioThemeData;

  DividerThemeData get dividerTheme;

  AppBarTheme get appBarTheme;

  TabBarTheme get tabBarTheme;

  Color get indicatorColor;

  BottomAppBarTheme get bottomAppBarTheme;

  DialogTheme get dialogTheme;

  ProgressIndicatorThemeData get progressIndicatorTheme;

}

ThemeData getTheme<T extends AppTheme>(T theme) => ThemeData(
      progressIndicatorTheme: theme.progressIndicatorTheme,
      cardTheme: theme.cardTheme,
      fontFamily: theme.fontFamily,
      textTheme: theme.textTheme,
      appBarTheme: theme.appBarTheme,
      iconTheme: theme.iconTheme,
      elevatedButtonTheme: theme.elevatedButtonTheme,
      textSelectionTheme: theme.textSelectionThemeData,
      inputDecorationTheme: theme.inputDecorationTheme,
      primaryIconTheme: theme.primaryIconTheme,
      textButtonTheme: theme.textButtonThemeData,
      dividerTheme: theme.dividerTheme,
      outlinedButtonTheme: theme.outlinedButtonThemeData,
      checkboxTheme: theme.checkboxThemeData,
      radioTheme: theme.radioThemeData,
      tabBarTheme: theme.tabBarTheme,
      indicatorColor: theme.indicatorColor,
      bottomAppBarTheme: theme.bottomAppBarTheme,
      dialogTheme: theme.dialogTheme,
      colorScheme: theme.colorScheme,
    );
