import 'package:flutter/material.dart';

/// Flutter extension for the [BuildContext] class, providing convenient access
/// to commonly used theme properties and colors.
extension ContextExtension on BuildContext {
  /// Returns the large headline text style from the current theme.
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;

  /// Returns the medium headline text style from the current theme.
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;

  /// Returns the small headline text style from the current theme.
  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;

  /// Returns the large title text style from the current theme.
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  /// Returns the medium title text style from the current theme.
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;

  /// Returns the small title text style from the current theme.
  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;

  /// Returns the large body text style from the current theme.
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  /// Returns the medium body text style from the current theme.
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;

  /// Returns the small body text style from the current theme.
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;

  /// Returns the large display text style from the current theme.
  TextStyle get displayLarge => Theme.of(this).textTheme.displayLarge!;

  /// Returns the medium display text style from the current theme.
  TextStyle get displayMedium => Theme.of(this).textTheme.displayMedium!;

  /// Returns the small display text style from the current theme.
  TextStyle get displaySmall => Theme.of(this).textTheme.displaySmall!;

  /// Returns the large label text style from the current theme.
  TextStyle get labelLarge => Theme.of(this).textTheme.labelLarge!;

  /// Returns the medium label text style from the current theme.
  TextStyle get labelMedium => Theme.of(this).textTheme.labelMedium!;

  /// Returns the small label text style from the current theme.
  TextStyle get labelSmall => Theme.of(this).textTheme.labelSmall!;

  /// Returns the primary color from the current theme's color scheme.
  Color get primary => Theme.of(this).colorScheme.primary;

  /// Returns the primary container color from the current theme's color scheme.
  Color get primaryContainer => Theme.of(this).colorScheme.primaryContainer;

  /// Returns the secondary color from the current theme's color scheme.
  Color get secondary => Theme.of(this).colorScheme.secondary;

  /// Returns the secondary container color from the current 
  /// theme's color scheme.
  Color get secondaryContainer => Theme.of(this).colorScheme.secondaryContainer;

  /// Returns the tertiary color from the current theme's color scheme.
  Color get tertiary => Theme.of(this).colorScheme.tertiary;

  /// Returns the surface color from the current theme's color scheme.
  Color get surface => Theme.of(this).colorScheme.surface;

  /// Returns the background color from the current theme's color scheme.
  Color get background => Theme.of(this).colorScheme.background;

  /// Returns the error color from the current theme's color scheme.
  Color get error => Theme.of(this).colorScheme.error;

  /// Returns the on-primary color from the current theme's color scheme.
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;

  /// Returns the on-secondary color from the current theme's color scheme.
  Color get onSecondary => Theme.of(this).colorScheme.onSecondary;

  /// Returns the on-surface color from the current theme's color scheme.
  Color get onSurface => Theme.of(this).colorScheme.onSurface;

  /// Returns the on-background color from the current theme's color scheme.
  Color get onBackground => Theme.of(this).colorScheme.onBackground;

  /// Returns the error color from the current theme's color scheme.
  Color get onError => Theme.of(this).colorScheme.onError;

  /// Returns the outline color from the current theme's color scheme.
  Color get outline => Theme.of(this).colorScheme.outline;

  /// Returns the brightness from the current theme's color scheme.
  Brightness get brightness => Theme.of(this).colorScheme.brightness;
}
