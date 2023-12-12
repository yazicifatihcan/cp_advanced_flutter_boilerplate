import 'package:flutter/material.dart';

///Abstract class that represent everything
///necessary for creating color palette.
abstract class AbstractColor {
  ///Theme code
  String get themeCode;

  ///Brightness of Color Palette
  Brightness get brightness;

  ///Primary
  Color get primary;

  ///OnPrimary
  Color get onPrimary;

  ///PrimaryContainer
  Color get primaryContainer;

  ///Secondary
  Color get secondary;

  ///OnSecondary
  Color get onSecondary;

  ///Tertiary
  Color get tertiary;

  ///OnTertiary
  Color get onTertiary;

  ///Scrim
  Color get scrim;

  ///SecondaryContainer
  Color get secondaryContainer;

  ///Surface
  Color get surface;

  ///OnSurface
  Color get onSurface;

  ///Background
  Color get background;

  ///OnBackground
  Color get onBackground;

  ///Error
  Color get error;

  ///OnError
  Color get onError;

  ///ErrorContainer
  Color get errorContainer;

  ///Outline
  Color get outline;
}
