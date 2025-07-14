import 'package:ecommerce_app/src/features/on_boarding/presentation/pages/on_boarding_page.dart';
import 'package:ecommerce_app/src/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import '../../features/login/screens/sign_in_email_screen.dart';
import '../../features/login/screens/sign_in_password_screen.dart';
import 'package:ecommerce_app/src/features/create_account/screens/create_account_screen.dart';

class Routes {
  static const String initial = '/';
  static const String onBoarding = '/on_boarding';
  static const String signInEmail = '/sign-in-email';
  static const String signInPassword = '/sign-in-password';
  static const String createAccount = '/create-Account';
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case Routes.signInEmail:
        return MaterialPageRoute(builder: (_) => const SignInEmailScreen());

      case Routes.signInPassword:
        return MaterialPageRoute(builder: (_) => const SignInPasswordScreen());

      case Routes.createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());

      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
