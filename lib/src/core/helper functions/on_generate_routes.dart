import 'package:ecommerce_app/src/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';


Route<dynamic> OnGenerateRoutes(RouteSettings settings) {
  
  switch (settings.name) {
    case SplashPage.routeName:
      return MaterialPageRoute(builder: (_) => const SplashPage());
    default:
      return MaterialPageRoute(builder: (_) => const Placeholder());
  }
}