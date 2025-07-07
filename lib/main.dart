
import 'package:flutter/material.dart';
import 'src/features//signin/sign_in_get_emil_screen.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF6A5AE0);
    const backgroundColorLight = Color(0xFFFFFFFF);
    const backgroundColorDark = Color(0xFF1D182A);

    final lightTheme = ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: backgroundColorLight,
      primaryColor: primaryColor,
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

    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: backgroundColorDark,
      primaryColor: primaryColor,
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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      home: const SignInGetEmailScreen(),
    );
  }
}
