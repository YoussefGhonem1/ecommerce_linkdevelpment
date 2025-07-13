import 'package:ecommerce_app/src/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:ecommerce_app/src/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String initial  = '/';
    static const String OnBoarding = '/on_boarding';
}
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.OnBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
    }
    return null;
  }
}
