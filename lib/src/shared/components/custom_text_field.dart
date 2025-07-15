import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: InputDecoration(
        filled: true,
        fillColor: isDarkMode ? AppColors.darkGrey : AppColors.lightGrey,
        hintStyle: TextStyle(
          color:
          isDarkMode ? AppColors.inputHintDark : AppColors.inputHintLight,
          fontSize: 17,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 15.0,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
      ),
    );
  }
}