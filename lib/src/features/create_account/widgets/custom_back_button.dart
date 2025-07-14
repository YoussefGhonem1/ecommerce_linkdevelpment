import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
      onPressed: () {
        Navigator.pushNamed(context, Routes.signInEmail);
      },
    );
  }
}
