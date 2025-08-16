import 'package:ecommerce_app/src/features/layout/models/orders_model.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:flutter/material.dart';

class OrderItemsSection extends StatelessWidget {
  final OrdersModel order;

  const OrderItemsSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final totalItems = order.items.length;
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(local.orderItems, style: theme.textTheme.headlineSmall),
        SizedBox(height: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isDarkMode ? AppColors.darkGrey : AppColors.lightGrey,
          ),
          child: Row(
            children: [
              Image.asset(
                isDarkMode
                    ? 'assets/icons/items_dark.png'
                    : 'assets/icons/items_light.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(width: 12),
              Text(
                "$totalItems ${local.items}",
                style: theme.textTheme.bodyMedium,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.orderItemsScreen,
                    arguments: order.items,
                  );
                },
                child: Text(
                  local.viewAll,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
