import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/product/utility/enums/project_radius.dart';

class ModuleTheme implements AppTheme {
  ModuleTheme({required this.appColors});

  AbstractColor appColors;

  @override
  IconThemeData get accentIconTheme => const IconThemeData(color: Colors.black);

  @override
  IconThemeData get primaryIconTheme => const IconThemeData(color: Colors.black);

  @override
  IconThemeData get iconTheme => const IconThemeData(color: Colors.black);

  @override
  ProgressIndicatorThemeData get progressIndicatorTheme => ProgressIndicatorThemeData(color: appColors.primary);

  @override
  ColorScheme get colorScheme => ColorScheme(
        primary: appColors.primary,
        primaryContainer: appColors.primaryContainer,
        secondary: appColors.secondary,
        secondaryContainer: appColors.secondaryContainer,
        tertiary: appColors.tertiary,
        surface: appColors.surface,
        background: appColors.background,
        error: appColors.error,
        onPrimary: appColors.onPrimary,
        onSecondary: appColors.onSecondary,
        onSurface: appColors.onSurface,
        onBackground: appColors.onBackground,
        onError: appColors.onError,
        brightness: appColors.brightness,
        outline: appColors.outline,
      );



  @override
  CardTheme get cardTheme => CardTheme(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ProjectRadius.medium.value)),
        color: Colors.black,
        margin: EdgeInsets.zero,
      );

  @override
  TextTheme get textTheme => TextTheme(
        labelLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        labelSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),

        displayLarge: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        displayMedium: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        displaySmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        
        headlineLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        headlineMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        headlineSmall: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),

        ///BodyText
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        bodyMedium: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        bodySmall: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        
        titleLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: appColors.surface,
        ),
        titleSmall: TextStyle(
          fontSize: 8,
          fontWeight: FontWeight.w400,
          color: appColors.surface,
        ),
      );

  @override
  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: appColors.primary,
          foregroundColor: Colors.white,
          disabledBackgroundColor: appColors.secondary,
          disabledForegroundColor: Colors.white,
          textStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ProjectRadius.large.value),
          ),
        ),
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: appColors.secondary,
        ),
        hintStyle: TextStyle(
          fontWeight: FontWeight.w400,
          color: appColors.secondary,
          fontSize: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            ProjectRadius.small.value,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            ProjectRadius.small.value,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            ProjectRadius.small.value,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            ProjectRadius.small.value,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(
            ProjectRadius.small.value,
          ),
        ),
      );

  @override
  TextSelectionThemeData get textSelectionThemeData => TextSelectionThemeData(
        cursorColor: appColors.primary,
        selectionColor: appColors.primary.withOpacity(0.2),
        selectionHandleColor: appColors.primary,
      );

  @override
  TextButtonThemeData get textButtonThemeData => TextButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(appColors.primary),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: appColors.primary,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
        ),
      );

  

  @override
  OutlinedButtonThemeData get outlinedButtonThemeData => OutlinedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
          foregroundColor: MaterialStateProperty.all<Color>(appColors.secondary),
          side: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) return BorderSide(color: appColors.secondary);
            return BorderSide(color: appColors.secondary);
          }),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
          textStyle: MaterialStateProperty.all<TextStyle>(
            TextStyle(
              color: appColors.secondary,
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(ProjectRadius.large.value),
            ),
          ),
        ),
      );

  @override
  CheckboxThemeData get checkboxThemeData => CheckboxThemeData(
        fillColor: MaterialStateProperty.all<Color?>(appColors.primary),
        checkColor: MaterialStateProperty.all<Color?>(Colors.white),
        side: BorderSide(width: 0.7, color: appColors.primary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ProjectRadius.small.value),
        ),
      );

  @override
  RadioThemeData get radioThemeData => RadioThemeData(
        fillColor: MaterialStateProperty.all<Color>(appColors.primary),
      );

  @override
  DividerThemeData get dividerTheme => DividerThemeData(
        color: appColors.secondary,
        space: 0,
      );

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        titleSpacing: 0,
        elevation: 0,
        color: appColors.secondary,
        titleTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: appColors.secondary,
        ),
        centerTitle: true,
        actionsIconTheme: IconThemeData(color: appColors.secondary),
        iconTheme: IconThemeData(color: appColors.secondary),
      );

  @override
  TabBarTheme get tabBarTheme => TabBarTheme(
        labelColor: appColors.primary,
        labelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: appColors.primary,
        ),
        unselectedLabelColor: appColors.secondary,
        unselectedLabelStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: appColors.secondary,
        ),
      );

  @override
  Color get indicatorColor => appColors.primary;

  @override
  BottomAppBarTheme get bottomAppBarTheme => const BottomAppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      );

  @override
  DialogTheme get dialogTheme => DialogTheme(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ProjectRadius.medium.value)),
      );

  @override
  String get fontFamily => '';
}
