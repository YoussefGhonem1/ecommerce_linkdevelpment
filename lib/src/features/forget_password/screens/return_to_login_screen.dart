import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import '../../../shared/routing/app_routes.dart';

class ReturnToLoginScreen extends StatelessWidget {
  const ReturnToLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Assets.imagesRestPasswordImage,
            width: 100,
          ),
          SizedBox(height: 20),
          Text("We Sent you an Email to reset your password.",
            style: theme.textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context, Routes.signInEmail);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8E6CEF),
                foregroundColor: Colors.white,
                disabledBackgroundColor: const Color(0xFF8E6CEF).withOpacity(0.6),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                child: Text("Return to Login"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
