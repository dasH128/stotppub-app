import 'package:flutter/material.dart';

class MyAppTheme {
  static Color color = Color(0xFFABC270); //Colors.yellow;
  static Color color2 = Color(0xFFFEC868);

  static ThemeData theme = ThemeData(
    fontFamily: 'Nunito',
    useMaterial3: true,
    primarySwatch: Colors.red,
    // colorSchemeSeed: color,
    primaryColor: Color(0xFFABC270), //Colors.purple,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: Colors.white),
      color: Color(0xFFABC270), //Colors.purple,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.deepPurple[50],
  );
}
