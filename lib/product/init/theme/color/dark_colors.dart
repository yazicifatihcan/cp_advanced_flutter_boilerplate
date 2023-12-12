import 'package:common/common.dart';
import 'package:flutter/material.dart';

/// Color palette for Dark Colors. Theme Code-> 'dark'
class DarkColors implements AbstractColor {
  @override
  Color get background => const Color(0xFFFFFFFF);

  @override
  Brightness get brightness => Brightness.light;

  @override
  Color get error => Colors.red;

  @override
  Color get errorContainer => const Color(0xFFFFCCCC);

  @override
  Color get onBackground => const Color(0xFF000000);

  @override
  Color get onError => Colors.white;

  @override
  Color get onPrimary => const Color(0xFF000000);

  @override
  Color get onSecondary => const Color(0xFF000000);

  @override
  Color get onSurface => const Color(0xFF000000);

  @override
  Color get onTertiary => const Color(0xFF000000);

  @override
  Color get outline => Colors.grey;

  @override
  Color get primary => Colors.blue;

  @override
  Color get primaryContainer => const Color(0xFFE3F2FD);

  @override
  Color get scrim => const Color(0x99000000);

  @override
  Color get secondary => Colors.green;

  @override
  Color get secondaryContainer => const Color(0xFFC8E6C9);

  @override
  Color get surface => Colors.white;

  @override
  Color get tertiary => Colors.orange;

  @override
  String get themeCode => 'dark';
}
