import 'package:flutter/material.dart';

import '../../../../core/utils/app_images.dart';
import '../../../shared/routing/app_routes.dart';

class BuildEmptyOrders extends StatelessWidget {
  const BuildEmptyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.imagesOrdersImage,
              width: 100,
            ),
            SizedBox(height: 20),
            Text("No Orders yet",
              style: theme.textTheme.headlineMedium?.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.pushNamed(context, Routes.categoryPage);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8E6CEF),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFF8E6CEF).withOpacity(0.6),
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                  child: Text("Explore Categories"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
