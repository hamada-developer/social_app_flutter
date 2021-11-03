import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/style/colors/app_colors.dart';

ThemeData lightTheme = ThemeData(

  textTheme: const TextTheme(
    headline6: TextStyle(
      fontSize: 16,
    ),
    caption: TextStyle(
      fontSize: 16,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontFamily: 'Jannah',
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.whiteColor,
    type: BottomNavigationBarType.fixed,
  ),
);
