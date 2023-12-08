import 'package:flutter/material.dart';

extension ThemeHelper on BuildContext {
  // Text theme
  TextStyle get bodySmall => Theme.of(this).textTheme.bodySmall!;
  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!;
  TextStyle get bodyLarge => Theme.of(this).textTheme.bodyLarge!;

  TextStyle get titleSmall => Theme.of(this).textTheme.titleSmall!;
  TextStyle get titleMedium => Theme.of(this).textTheme.titleMedium!;
  TextStyle get titleLarge => Theme.of(this).textTheme.titleLarge!;

  TextStyle get headlineSmall => Theme.of(this).textTheme.headlineSmall!;
  TextStyle get headlineMedium => Theme.of(this).textTheme.headlineMedium!;
  TextStyle get headlineLarge => Theme.of(this).textTheme.headlineLarge!;

  // Colors
  Color get primary => Theme.of(this).colorScheme.primary;
  Color get onPrimary => Theme.of(this).colorScheme.onPrimary;
  Color get background => Theme.of(this).colorScheme.background;
  Color get onBackground => Theme.of(this).colorScheme.onBackground;
  Color get onSurface => Theme.of(this).colorScheme.onSurface;
  Color get error => Theme.of(this).colorScheme.error;
  Color get onError => Theme.of(this).colorScheme.onError;
}
