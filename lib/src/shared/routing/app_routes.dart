
import 'package:flutter/material.dart';
import '../../features/products_by_category/screens/products_by_category_screen.dart';
import '../../features/shopping_category/presentation/pages/category_page.dart';
import '../../features/layout/screens/layout_screen.dart';
import '../../features/login/screens/pages/sign_in_email_screen.dart';
import '../../features/login/screens/pages/sign_in_password_screen.dart';
import '../../features/on_boarding/presentation/pages/on_boarding_page.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/forget_password/screens/forget_password_screen.dart';
import '../../features/forget_password/screens/return_to_login_screen.dart';
import '../../features/create_account/screens/create_account_screen.dart';

class Routes {
  static const String initial = '/';
  static const String onBoarding = '/on_boarding';
  static const String categoryPage = '/category_page';
  static const String signInEmail = '/sign-in-email';
  static const String signInPassword = '/sign-in-password';
  static const String forgetPassword = '/forget_password';
  static const String returnToLogin = '/return_to_login';
  static const String createAccount = '/create-Account';
  static const String layout = '/layout';
  static const String productsByCategoryScreen = '/products_by_category';
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
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      case Routes.returnToLogin:
        return MaterialPageRoute(builder: (_) => const ReturnToLoginScreen());
      case Routes.signInPassword:
        return MaterialPageRoute(builder: (_) => const SignInPasswordScreen());
      case Routes.createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
      case Routes.layout:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case Routes.categoryPage:
        return MaterialPageRoute(builder: (_) => const CategoriesPage());
      case Routes.productsByCategoryScreen:
        final categoryTitle = settings.arguments as String;
        return MaterialPageRoute(builder: (_) =>  ProductsByCategoryScreen(categoryTitle: categoryTitle,));

      
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
