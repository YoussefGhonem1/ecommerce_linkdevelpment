import 'package:flutter/material.dart';
import '../../../../generated/assets.dart';
import '../../../shared/components/explore_categories_button.dart';

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
            Image.asset(Assets.imagesOrdersImage, width: 100),
            SizedBox(height: 20),
            Text(
              "No Orders yet",
              style: theme.textTheme.headlineMedium?.copyWith(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const ExploreCategoriesButton(),
          ],
        ),
      ),
    );
  }
}
