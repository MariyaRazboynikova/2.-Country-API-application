import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    surface: Color.fromARGB(255, 137, 191, 216),
    primary: Color.fromARGB(255, 27, 70, 88),
    secondary: Color.fromARGB(255, 144, 132, 214),
    tertiary: Color.fromARGB(255, 47, 19, 83),
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 27, 70, 88),
    primary: Color.fromARGB(255, 137, 191, 216),
    secondary: Color.fromARGB(255, 47, 19, 83),
    tertiary: Color.fromARGB(255, 144, 132, 214),
  ),
);
