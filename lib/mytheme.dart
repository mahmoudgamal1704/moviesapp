import 'package:flutter/material.dart';

class MyTheme {
  static Color mainBGColor = Color.fromRGBO(18, 19, 18, 1.0);
  static Color colorwhite = Color.fromRGBO(248, 248, 248, 1.0);
  static Color secColor = Color.fromRGBO(255, 187, 59, 1.0);
  static Color bottomBGColor = Color.fromRGBO(73, 73, 73, 1.0);
  static Color err = Color.fromRGBO(255, 0, 0, 1.0);

  static ThemeData darkTheme = ThemeData(
    primaryColor: mainBGColor,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: mainBGColor,
        onPrimary: colorwhite,
        secondary: secColor,
        onSecondary: colorwhite,
        error: err,
        onError: colorwhite,
        background: Colors.transparent,
        onBackground: colorwhite,
        surface: Colors.grey,
        onSurface: Colors.grey),
    scaffoldBackgroundColor: mainBGColor,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: colorwhite),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: bottomBGColor,
      selectedItemColor: secColor,
      unselectedItemColor: colorwhite,
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: colorwhite),
      // subtitle1: TextStyle(
      //     fontSize: 25, fontWeight: FontWeight.bold, color: darkyellow),
      subtitle2: TextStyle(
          fontSize: 25, fontWeight: FontWeight.w600, color: colorwhite),
      // bodyText1:  TextStyle(
      //     fontSize: 25, fontWeight: FontWeight.w600, color: colorBlack),
      // bodyText2:  TextStyle(
      //     fontSize: 25, fontWeight: FontWeight.w600, color: darkyellow),
    ),
  );
}