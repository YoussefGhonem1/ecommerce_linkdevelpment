import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
        size: 26.sp,
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      onPrimary: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.black54,
      ),
    ),
  );


  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgDarkColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgDarkColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.white,
        size: 26.sp,
      ),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.bgDarkColor,
      primary: AppColors.bgDarkColor,
      onPrimary: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white70,
      ),
      bodyMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white70,
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white54,
      ),
    ),
  );

}
