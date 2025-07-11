
import 'src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'src/shared/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.signInEmail,  //change when splash screen done
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
