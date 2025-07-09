import 'package:flutter/material.dart';

import '../features/screens/splash_screen.dart';

class Routes {
  static const initial = '/';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
    return null;
  }
}