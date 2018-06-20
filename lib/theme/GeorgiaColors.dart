import 'package:flutter/material.dart';

final ThemeData georgiaThemeData = new ThemeData(
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    accentColor: GeorgiaColors.ceruleanBlue[500],
    accentColorBrightness: Brightness.light
);

class GeorgiaColors {
  GeorgiaColors._(); // this basically makes it so you can instantiate this class

  static const _ceruleanBluePrimary = 0xFF1c70b5;

  static const MaterialColor ceruleanBlue = const MaterialColor(
    _ceruleanBluePrimary,
    const <int, Color>{
      100:  const Color(0xFF00a5a7),
      300: const Color(0xFF0097a7),
      500: const Color(0xFF0089a7),
      700: const Color(0xFF007BA7),
      900: const Color(0xFF1c70b5)
    },
  );
}
