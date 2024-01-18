import 'package:flutter/material.dart';
import 'package:mumag/features/profile/domain/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@riverpod
ThemeData appTheme(AppThemeRef ref) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

@riverpod
Future<AppColorScheme> dynamicColorScheme(
  DynamicColorSchemeRef ref, {
  required String? imageUrl,
}) async {
  const colorScheme = AppColorScheme();
  try {
    if (imageUrl == null) {
      return colorScheme;
    }

    final dynamicScheme = await colorScheme.getColors(imgUrl: imageUrl);

    return dynamicScheme;
  } catch (e) {
    return colorScheme;
  }
}
