import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButtonOnboarding extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const CustomButtonOnboarding({
    super.key,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20), 
          border: Border.all(
            color: AppColors.bgDarkColor,
            width: 2,
          ),
        ),
        child: Container(
          decoration: BoxDecoration( 
          color: AppColors.bgDarkColor,
          borderRadius: BorderRadius.circular(16), 
          
        ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
            
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.lightGrey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
