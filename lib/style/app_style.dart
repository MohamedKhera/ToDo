import 'package:flutter/material.dart';

class AppStyle{
  static const Color primaryLigh = Color(0xff3598DB);
  static const Color primaryDark = Color(0xff060E1E);
  static ThemeData lightMode = ThemeData(

    scaffoldBackgroundColor: const Color(0xffDFECDB),
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryLigh,
      toolbarHeight: 160,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryLigh,
    primary: primaryLigh,
    ),
  );

  static ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: primaryDark,
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryDark,
      primary: primaryDark,
    ),
  );
}