import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EmptyCartPage extends StatelessWidget {
  const EmptyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25, left: 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomBackButtonIcon(),
                ),
              ),

              const Spacer(),
              Image.asset('assets/icons/parcel.png', height: 120),

              const SizedBox(height: 16),

              Text(
                "Your Cart is Empty",
                style: theme.textTheme.headlineMedium?.copyWith(fontSize: 30),
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.categoryPage);
                },
                child: const Text(
                  "Explore Categories",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
