import 'package:ecommerce_app/src/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce_app/src/features/cart/widgets/card_item_card.dart';
import 'package:ecommerce_app/src/features/cart/widgets/coupon_code_card.dart';
import 'package:ecommerce_app/src/features/cart/widgets/price_row.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/translation/app_localizations.dart';
import '../../checkout/model/checkout_model.dart';

class FullCartPage extends ConsumerWidget {
  const FullCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final cartNotifier = ref.read(cartProvider.notifier);

    CheckoutModel checkout = CheckoutModel(
      subtotal: cartNotifier.subtotal,
      shippingCost: cartNotifier.shipping,
      tax: cartNotifier.tax,
      total: cartNotifier.total,
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomBackButtonIcon(),
                    ),
                    Center(
                      child: Text(
                        local.cartTitle,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  ref.read(cartProvider.notifier).clearCart();
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    local.removeAll,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              CartItemCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PriceRow(local.subtotal, cartNotifier.subtotal),
            PriceRow(local.shipping, cartNotifier.shipping),
            PriceRow(local.tax, cartNotifier.tax),
            PriceRow(local.total, cartNotifier.total),
            const SizedBox(height: 30),
            CouponCodeCard(),
            const SizedBox(height: 20),
            CustomButton(
              text: local.checkout,
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Routes.checkoutScreen,
                  arguments: checkout,
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
