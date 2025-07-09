import 'package:ecommerce_app/src/theme/app_colors.dart';
import 'package:flutter/material.dart';

abstract class AppTheme{
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.bgLightColor,
      primaryColor: AppColors.primaryColor,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF4F4F4), 
        hintStyle: const TextStyle(color: Color(0x80272727)),
      ),
    );

    static ThemeData  darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.bgDarkColor,
      primaryColor: AppColors.primaryColor,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF342F3F),
        hintStyle: const TextStyle(color: Color(0x80FFFFFF)),
      ),
    );
}