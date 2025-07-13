import 'package:flutter/material.dart';

class CustoBackButton extends StatelessWidget {
  const CustoBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new, size: 20),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
