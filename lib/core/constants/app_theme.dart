import 'package:flutter/material.dart';

class AppTheme {
  static const Color darkBackground = Color(0xFF1C1C1E);
  static const Color primary = Color(0xFF246BFD);

  static ThemeData get dark => ThemeData.dark().copyWith(
    scaffoldBackgroundColor: darkBackground,
    colorScheme: const ColorScheme.dark(
      primary: primary,
      secondary: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData get light => ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.grey[100],
    colorScheme: const ColorScheme.light(
      primary: primary,
      secondary: Colors.black,
    ),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white, elevation: 0),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.white,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
