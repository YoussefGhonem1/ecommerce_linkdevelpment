import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: CustomBackButtonIcon(),
        ),
        leadingWidth: 100,
        title: Text("Address", style: theme.textTheme.headlineSmall),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: theme.cardColor,
              borderRadius: BorderRadius.circular(16),
            ),

            child: Row(
              children: [
                Expanded(
                  child: Text("hello", style: theme.textTheme.bodyMedium),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          Navigator.pushNamed(context, Routes.addAddressPage);
        },
        child: Icon(Icons.add, color: theme.cardColor),
      ),
    );
  }
}
