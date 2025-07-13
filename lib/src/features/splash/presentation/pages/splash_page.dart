import 'package:ecommerce_app/src/features/splash/presentation/widgets/SplashPageBody.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  static const String routeName = 'splash';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SplashPageBody(), 
    );
  }
}