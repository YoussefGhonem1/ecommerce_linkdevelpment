import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTabBarItem extends StatelessWidget {
  final String title;
  final bool isSelected;

  const CustomTabBarItem({
    super.key,
    required this.title,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color:
            isSelected
                ? AppColors.primaryColor
                : theme.brightness == Brightness.dark
                ? AppColors.darkGrey
                : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.bgLightColor),
      ),
      child: Row(children: [Text(title, style: theme.textTheme.bodySmall)]),
    );
  }
}
