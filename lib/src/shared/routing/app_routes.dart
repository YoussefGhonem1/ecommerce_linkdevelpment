import 'package:ecommerce_app/src/features/address/screens/add_address_page.dart';
import 'package:ecommerce_app/src/features/address/screens/address_page.dart';
import 'package:ecommerce_app/src/features/address/screens/edit_address_page.dart';
import 'package:ecommerce_app/src/features/checkout/model/checkout_model.dart';
import 'package:ecommerce_app/src/features/checkout/screens/checkout_screen.dart';
import 'package:ecommerce_app/src/features/cart/screens/cart_page.dart';
import 'package:ecommerce_app/src/features/my_favouits/screens/my_favorit_screen.dart';
import 'package:ecommerce_app/src/features/order-placed-successfully/order-placed-successfully.dart';
import 'package:ecommerce_app/src/features/order_details/models/order_model.dart';
import 'package:ecommerce_app/src/features/order_details/screens/order_details_screen.dart';
import 'package:ecommerce_app/src/features/payment/screens/payment_screen.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/pages/product_details_page.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:flutter/material.dart';
import '../../features/payment/screens/add_card_screen.dart';
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
import '../../features/edit_account/edit_account.dart';
import '../../features/search_screen/search_screen.dart';

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
  static const String orderDetails = '/order_details';
  static const String loadingScreen = '/loading-screen';
  static const String productDetailScreen = '/product_detail_screen';
  static const String checkoutScreen = '/checkout_screen';
  static const String cartPage = '/cart_page';
  static const String orderPlaced = '/order_placed_successfully_screen';
  static const String addressPage = '/address_page';
  static const String addAddressPage = '/add_address_page';
  static const String paymentScreen = '/address_screen';
  static const String addPaymentScreen = '/add_payment_screen';
  static const String editAddressPage = '/edit_address_page';
  static const String myFavourites = '/my-favourites';
  static const String editAccount = '/edit_Account';
  static const String searchScreen = "/search_screen";
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
        final email = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => SignInPasswordScreen(email: email),
        );
      case Routes.createAccount:
        return MaterialPageRoute(builder: (_) => const CreateAccountPage());
      case Routes.layout:
        return MaterialPageRoute(builder: (_) => const LayoutScreen());
      case Routes.categoryPage:
        return MaterialPageRoute(builder: (_) => const CategoriesPage());
      case Routes.myFavourites:
        return MaterialPageRoute(builder: (_) => const MyFavouritScreen());
      case Routes.productDetailScreen:
        final product = settings.arguments as Product;
        return MaterialPageRoute(builder: (_) =>  ProductDetailScreen(product: product,));
      case Routes.orderPlaced:
        return MaterialPageRoute(
          builder: (_) => const OrderPlacedSuccessScreen(),
        );
      case Routes.productsByCategoryScreen:
        final categoryTitle = settings.arguments as String;
        return MaterialPageRoute(
          builder:
              (_) => ProductsByCategoryScreen(categoryTitle: categoryTitle),
        );
      case Routes.orderDetails:
        final order = settings.arguments as Order;
        return MaterialPageRoute(
          builder: (_) => OrderDetailsScreen(order: order),
        );
      case Routes.checkoutScreen:
        final checkoutModel = settings.arguments as CheckoutModel;
        return MaterialPageRoute(
          builder: (_) => CheckoutScreen(checkoutModel: checkoutModel),
        );
      case Routes.cartPage:
        return MaterialPageRoute(builder: (_) => const CartPage());
      case Routes.addressPage:
        return MaterialPageRoute(builder: (_) => const AddressPage());
      case Routes.addAddressPage:
        return MaterialPageRoute(builder: (_) => const AddAddressPage());
      case Routes.paymentScreen:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case Routes.addPaymentScreen:
        return MaterialPageRoute(builder: (_) => const AddCardScreen());
      case Routes.editAddressPage:
        final address = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder:
              (_) => EditAddressPage(
                address: address['address'],
                userId: address['userId'],
              ),
        );
      case Routes.editAccount:
        return MaterialPageRoute(builder: (_) => const EditAccountPage());
      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

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
