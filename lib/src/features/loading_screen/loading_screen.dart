import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:ecommerce_app/src/models/product_model.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool _isPreloading = false; // To prevent multiple triggers

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!_isPreloading) {
      _isPreloading = true;
      _preloadImagesAndNavigate();
    }
  }

  Future<void> _preloadImagesAndNavigate() async {
    // Preload all product images
    for (final product in ProductModel.products) {
      await precacheImage(NetworkImage(product.imageUrl), context);
    }

    // Optional delay for better UX
    await Future.delayed(const Duration(seconds: 1));

    // Navigate to Home
    if (mounted) {
      Navigator.pushNamed(context, Routes.layout);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Loading...\nThanks for your patience',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
