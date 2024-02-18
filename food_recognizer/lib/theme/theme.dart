import 'package:flutter/material.dart';

Color backColor = Colors.green.shade600.withAlpha(190);

final themedata = ThemeData(
  fontFamily: 'ClashGrotesk',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 30,
      color: Color.fromARGB(240, 255, 255, 255),
    ),
    displayMedium: TextStyle(
      fontSize: 25,
      color: Color.fromARGB(240, 255, 255, 255),
    ),
    displaySmall: TextStyle(
      fontSize: 16,
      color: Color.fromARGB(240, 255, 255, 255),
    ),
  ),
  scaffoldBackgroundColor: Colors.deepPurple.shade500.withAlpha(130),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.deepPurple.shade400.withAlpha(255),
    centerTitle: true,
    foregroundColor: Colors.white70,
    titleTextStyle: const TextStyle(
      fontFamily: 'ClashGrotesk',
      fontSize: 30.0,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 24,
        fontFamily: 'ClashGrotesk',
      ),
      backgroundColor: Colors.green.shade600.withAlpha(190),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(0),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 16,
        fontFamily: 'ClashGrotesk',
      ),
      backgroundColor: Colors.green.shade600.withAlpha(190),
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: const EdgeInsets.all(0),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.white.withAlpha(190),
      fontSize: 20,
    ),
    hintStyle: TextStyle(
      color: Colors.white.withAlpha(190),
      fontSize: 20,
    ),
  ),
  useMaterial3: true,
);
