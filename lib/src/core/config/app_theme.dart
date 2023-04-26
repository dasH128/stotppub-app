import 'package:flutter/material.dart';

class MyAppTheme {
  var color = Colors.yellow;

  static ThemeData theme = ThemeData(
    fontFamily: 'Nunito',
    useMaterial3: true,
    primarySwatch: Colors.green,
    primaryColor: Colors.green,
    appBarTheme: const AppBarTheme(
      color: Colors.green,
      centerTitle: false,
    ),
    scaffoldBackgroundColor: Colors.deepPurple[50],
  );
}
