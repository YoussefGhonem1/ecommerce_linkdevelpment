import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF8E6CEF),
        foregroundColor: Colors.white,
        disabledBackgroundColor: const Color(0xFF8E6CEF).withOpacity(0.6),
        minimumSize: const Size(double.infinity, 56),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      child: Text(text),
    );
  }
}