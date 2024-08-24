import 'package:flutter/material.dart';

class AppStyle{
  static const Color primaryLigh = Color(0xff3598DB);
  static ThemeData lightMode = ThemeData(

    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
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
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
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
}