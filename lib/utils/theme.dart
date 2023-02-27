import 'package:flutter/material.dart';

class Themes {
  final lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      background: Colors.grey.shade300,
      secondary: Colors.tealAccent.shade700,
    ),
    primaryColor: Colors.orange,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        // foregroundColor: Colors.black,
        // backgroundColor: Colors.grey.shade300,
        ),
  );

  final dartTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade800,
      secondary: Colors.tealAccent,
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
    ),
    primaryColor: Colors.orange,
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        // foregroundColor: Colors.white,
        // backgroundColor: Colors.teal.shade500,
        ),
  );
}
