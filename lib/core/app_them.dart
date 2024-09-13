import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'app_colors.dart';


class ApplicationThem{

  static ThemeData mythem= ThemeData(
canvasColor: AppColor.navigationbarcolor,
    appBarTheme: AppBarTheme(
        backgroundColor: AppColor.navigationbarcolor,
        centerTitle: true,

    ),
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      backgroundColor: AppColor.navigationbarcolor,
      selectedItemColor: AppColor.orangcolor,
      unselectedItemColor: AppColor.whitecolor,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      selectedIconTheme: IconThemeData(
        size: 18
      ),
      unselectedIconTheme: IconThemeData(
        size: 18
      )
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'poppins',
        fontSize: 30,
      ),

      bodyMedium: TextStyle(

          fontSize: 30,
          fontWeight: FontWeight.w700,
          fontFamily: 'poppins'),
      bodySmall: TextStyle(

          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColor.whitecolor
      ),
    ),
  );

}