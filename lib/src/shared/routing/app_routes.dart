import 'package:flutter/material.dart';
import '../../features/login/screens/sign_in_email_screen.dart';
import '../../features/login/screens/sign_in_password_screen.dart';


class Routes {
  static const String initial = '/';
  static const String signInEmail = '/sign-in-email';
  static const String signInPassword = '/sign-in-password';
}

/// إدارة المسارات
class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
   //   case Routes.initial:
     //   return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.signInEmail:
        return MaterialPageRoute(builder: (_) => const SignInEmailScreen());

      case Routes.signInPassword:
        return MaterialPageRoute(builder: (_) => const SignInPasswordScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Page Not Found')),
          ),
        );
    }
  }
}
