import 'package:ecommerce_app/src/features/order_details/models/order_model.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:flutter/material.dart';

class ShippingDetailsSection extends StatelessWidget {
  final Order order;

  const ShippingDetailsSection({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(local.shippingDetails, style: theme.textTheme.headlineSmall),
        SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.darkGrey : AppColors.lightGrey,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(order.address, style: theme.textTheme.bodySmall),
              const SizedBox(height: 12),
              Text(order.phone, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ],
    );
  }
}
