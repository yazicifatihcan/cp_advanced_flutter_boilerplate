import 'package:common/common.dart';
import 'package:flutter/material.dart';

class DarkColors implements AbstractColor {
  @override
  Color get background => const Color(0xFFFFFFFF); // Background color

  @override
  Brightness get brightness => Brightness.light; // Brightness setting

  @override
  Color get error => Colors.red; // Error color

  @override
  Color get errorContainer => const Color(0xFFFFCCCC); // Error container color

  @override
  Color get onBackground => const Color(0xFF000000); // Text color on background

  @override
  Color get onError => Colors.white; // Text color on error

  @override
  Color get onPrimary => const Color(0xFF000000); // Text color on primary

  @override
  Color get onSecondary => const Color(0xFF000000); // Text color on secondary

  @override
  Color get onSurface => const Color(0xFF000000); // Text color on surface

  @override
  Color get onTertiary => const Color(0xFF000000); // Text color on tertiary

  @override
  Color get outline => Colors.grey; // Outline color

  @override
  Color get primary => Colors.blue; // Primary color

  @override
  Color get primaryContainer => const Color(0xFFE3F2FD); // Primary container color

  @override
  Color get scrim => const Color(0x99000000); // Scrim color

  @override
  Color get secondary => Colors.green; // Secondary color

  @override
  Color get secondaryContainer => const Color(0xFFC8E6C9); // Secondary container color

  @override
  Color get surface => Colors.white; // Surface color

  @override
  Color get tertiary => Colors.orange; // Tertiary color

  @override
  String get themeCode => "light"; // Theme code

  // Add more properties and their implementations as needed...
}