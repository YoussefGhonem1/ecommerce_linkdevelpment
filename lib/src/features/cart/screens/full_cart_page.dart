import 'package:ecommerce_app/src/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce_app/src/features/cart/widgets/card_item_card.dart';
import 'package:ecommerce_app/src/features/cart/widgets/coupon_code_card.dart';
import 'package:ecommerce_app/src/features/cart/widgets/price_row.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FullCartPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cartNotifier = ref.read(cartProvider.notifier);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 100,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomBackButtonIcon(),
                    ),
                    Center(
                      child: Text(
                        'Cart',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'Remove All',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              CartItemCard(),
              const SizedBox(height: 120),
              buildPriceRow("Subtotal", cartNotifier.subtotal),
              buildPriceRow("Shipping", cartNotifier.shipping),
              buildPriceRow("Tax", cartNotifier.tax),
              buildPriceRow("Total", cartNotifier.total),
              const SizedBox(height: 30),
              CouponCodeCard(),
              const SizedBox(height: 40),
              CustomButton(text: 'Checkout', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
