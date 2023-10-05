import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    color: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.white,
    selectedItemColor: Colors.deepPurple,
    unselectedItemColor: Colors.grey,
    elevation: 40,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.black,
      height: 1.3.h,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepPurple,
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    color: HexColor('333739'),
    elevation: 0,
    titleTextStyle: TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: HexColor('333739'),
    selectedItemColor: Colors.deepPurple, // Use your desired color here.
    unselectedItemColor: Colors.grey,
    elevation: 40,
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    subtitle1: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: Colors.grey[200], // Use a contrasting color like Colors.grey[200]
      height: 1.3.h,
    ),
  ),

);
