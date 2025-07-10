import 'package:flutter/material.dart';
import '../../features/login/screens/example_screen.dart';


class Routes {
  static const initial = '/';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const ExampleScreen());
    }
    return null;
  }
}