import 'package:flutter/material.dart';
import 'package:mumag/common/theme/color_schemes.g.dart';

final class AppColorScheme {
  const AppColorScheme({
    this.light = lightColorScheme,
    this.dark = darkColorScheme,
  });

  Future<AppColorScheme> getColors({required String imgUrl}) async {
    final lightScheme = await ColorScheme.fromImageProvider(
      provider: NetworkImage(imgUrl),
    );

    final darkScheme = await ColorScheme.fromImageProvider(
      provider: NetworkImage(imgUrl),
      brightness: Brightness.dark,
    );

    return AppColorScheme(light: lightScheme, dark: darkScheme);
  }

  /*  Map<String, dynamic> toMap(){
    return {'light': light.toString()}
  } */

  final ColorScheme light;
  final ColorScheme dark;
}
