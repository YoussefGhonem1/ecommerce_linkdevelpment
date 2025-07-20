import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/src/shared/components/explore_categories_button.dart';
import 'package:flutter/material.dart';

class BuildEmptyNotification extends StatelessWidget {
  const BuildEmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.noNotificationBell,
          ),
          const SizedBox(height: 16),
          Text(
            'No Notification yet',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 20),
          const ExploreCategoriesButton(),
        ],
      ),
    );
  }
}