
import 'package:flutter/material.dart';

class MyTheme{

  static const Color PrimaryColor =  Color(0xff367ae0);
  static const Color White =  Color(0xffffffff);
  static const Color black =  Color(0xff393939);
  static const Color green =  Color(0xff3df105);
  static const Color red =  Color(0xffff0044);
  static const Color gray =  Color(0xff707070);
  static const Color whiteGray =  Color(0xff9d9696);
  static const Color backgroundColor =  Color(0xE2F3F3F3);
  static const Color blackDarkColor =  Color(0xff131923);
  static const Color backgroundDarkColor =  Color(0xff070e1f);
  static ThemeData lightTheme =ThemeData(
    primaryColor: PrimaryColor,
    scaffoldBackgroundColor: backgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: PrimaryColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: White
      )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: PrimaryColor,
      unselectedItemColor: whiteGray,

    ),
    floatingActionButtonTheme:FloatingActionButtonThemeData(
      backgroundColor: PrimaryColor,
        iconSize: 35,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35),
            side: BorderSide(color: White,width: 4)),

    ),

  );

}