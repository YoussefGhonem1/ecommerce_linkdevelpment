import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    cardColor: AppColors.lightGrey,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bgLightColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.darkGrey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightGrey,
      hintStyle: TextStyle(
        color: AppColors.inputHintLight,
        fontSize: 17,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black, size: 26),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      onPrimaryContainer: AppColors.lightGrey,
      onPrimaryFixed: Colors.black,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.greyLightFontColor,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    cardColor: AppColors.darkGrey,
    scaffoldBackgroundColor: AppColors.bgDarkColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bgDarkColor,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.darkGrey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkGrey,
      hintStyle: TextStyle(
        color: AppColors.inputHintDark,
        fontSize: 17,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgDarkColor,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white, size: 26),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.bgDarkColor,
      primary: AppColors.bgDarkColor,
      onPrimaryContainer: AppColors.darkGrey,
      onPrimaryFixed: Colors.white,
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      bodySmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.greyDarkColor,
      ),
    ),
  );
}
