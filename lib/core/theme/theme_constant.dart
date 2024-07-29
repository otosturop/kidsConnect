import 'package:flutter/material.dart';

import '../constants/color_constant.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromRGBO(0, 0, 134, 1),
    foregroundColor: Colors.white,
    centerTitle: true,
  ),
  cardTheme: const CardTheme(color: Color(0xFF0f3355), surfaceTintColor: Color(0xFF0f3355)),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: myPrimaryColor,
    onPrimary: myOnPrimaryColor,
    secondary: mySecondaryColor,
    onSecondary: myOnSecondaryColor,
    error: myError,
    onError: myOnError,
    surface: Color(0xFFe8ebf4),
    onSurface: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
);
