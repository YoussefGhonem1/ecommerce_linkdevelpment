import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';

class ExploreCategoriesButton extends StatelessWidget {
  const ExploreCategoriesButton({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    return ElevatedButton(
      onPressed: () => Navigator.pushNamed(context, Routes.categoryPage),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        minimumSize: const Size(185, 52),
      ),
      child: Text(
        local.exploreCategories,
        style: Theme.of(
          context,
        ).textTheme.bodyMedium?.copyWith(color: Colors.white),
      ),
    );
  }
}
