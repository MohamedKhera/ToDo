import 'package:flutter/material.dart';

class AppStyle{
  static const Color primaryLigh = Color(0xff3598DB);
  static const Color primaryDark = Color(0xff060E1E);
  static ThemeData lightMode = ThemeData(

    scaffoldBackgroundColor: const Color(0xffDFECDB),
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryLigh,
      shape: StadiumBorder(
        side: BorderSide(
          color: Colors.white,
          width: 3,
        )
      ),

    ),
    iconTheme: const IconThemeData(

    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontFamily: "Poppins",
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
      titleMedium: TextStyle(
        color: primaryLigh,
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
    ),
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryLigh,
    primary: primaryLigh,
    ),
  );

  static ThemeData darkMode = ThemeData(
    scaffoldBackgroundColor: primaryDark,
    appBarTheme: const AppBarTheme(
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
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
      size: 20
    ),
    textTheme: const TextTheme(
      headlineLarge: TextStyle(
        color: Colors.white,
        fontFamily: "Poppins",
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"
      ),
      titleMedium: TextStyle(
        color: primaryLigh,
        fontFamily: "Poppins",
        fontSize: 18,
        fontWeight: FontWeight.w700,
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