import 'package:ecommerce_app/src/features/forget_password/screens/forget_password_screen.dart';
import 'package:ecommerce_app/src/features/forget_password/screens/return_to_login_screen.dart';
import 'package:ecommerce_app/src/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:flutter/material.dart';

class Routes{
  static const String initial  = '/';
  static const String onBoarding = '/on_boarding';
  static const String forgetPassword = '/forget_password';
  static const String returnToLogin = '/return_to_login';
}
class AppRoutes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.returnToLogin:
        return MaterialPageRoute(builder: (_) => const ReturnToLoginScreen());
    }
    return null;
  }
}