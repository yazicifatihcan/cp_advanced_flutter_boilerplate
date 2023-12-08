import 'package:flutter/material.dart';

abstract class AbstractColor{

  String get themeCode;
  Brightness get brightness;

  
  Color get primary;
  Color get onPrimary;
  Color get primaryContainer;
  Color get secondary;
  Color get onSecondary;
  Color get tertiary;
  Color get onTertiary;
  Color get scrim;
  Color get secondaryContainer;
  Color get surface;
  Color get onSurface;
  Color get background;
  Color get onBackground;
  Color get error;
  Color get onError;
  Color get errorContainer;
  Color get outline;

  
}
