import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../../features/login/screens/sign_in_email_screen.dart';
import '../../features/login/screens/sign_in_password_screen.dart';

class Routes {
  static const String initial = '/';
  static const String onBoarding = '/on_boarding';
  static const String signInEmail = '/sign-in-email';
  static const String signInPassword = '/sign-in-password';
=======
import '../../features/login/screens/CreateAccount/CreateAccount.dart';

class Routes {
  static const initial = '/';
  static const createAccount = '/createAccount';
>>>>>>> f5f0f0c (Create Account Screen Added)
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
<<<<<<< HEAD
      case Routes.initial:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.onBoarding:
        return MaterialPageRoute(builder: (_) => const OnBoardingPage());
      case Routes.signInEmail:
        return MaterialPageRoute(builder: (_) => const SignInEmailScreen());

      case Routes.signInPassword:
        return MaterialPageRoute(builder: (_) => const SignInPasswordScreen());

      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
=======
      case '/createAccount':
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
>>>>>>> f5f0f0c (Create Account Screen Added)
    }
  }
}
