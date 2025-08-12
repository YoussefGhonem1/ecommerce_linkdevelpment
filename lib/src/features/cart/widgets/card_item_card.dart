import 'package:ecommerce_app/src/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/translation/app_localizations.dart';

class CartItemCard extends ConsumerWidget {
  const CartItemCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context)!;

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.imageUrl,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: theme.textTheme.bodyMedium),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          "${local.size} - ",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyDarkColor,
                          ),
                        ),
                        Text(
                          "M", // TODO: Get actual size from item if available
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${local.color} - ",
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: AppColors.greyDarkColor,
                          ),
                        ),
                        Text(
                          "Lemon", // TODO: Get actual color from item if available
                          style: theme.textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${local.currencySymbol}${item.price}",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: () =>
                            ref.read(cartProvider.notifier).increaseQuantity(item.id),
                        child: Icon(
                          Icons.add_circle,
                          color: AppColors.primaryColor,
                          size: 25,
                        ),
                      ),
                      const SizedBox(width: 2),
                      GestureDetector(
                        onTap: () =>
                            ref.read(cartProvider.notifier).decreaseQuantity(item.id),
                        child: Icon(
                          Icons.remove_circle,
                          color: AppColors.primaryColor,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
