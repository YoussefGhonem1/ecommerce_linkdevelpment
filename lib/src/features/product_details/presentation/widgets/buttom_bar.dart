import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/core/service/fcm.dart';
import 'package:ecommerce_app/src/features/cart/controllers/cart_controller.dart';
import 'package:ecommerce_app/src/features/cart/models/cart_item.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/manager/quantity_notifier.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBar extends ConsumerWidget {
  final double price;
  final String productName;
  final String selectedSize;
  final String selectedColor;
  final Product product;

  const BottomBar({super.key, required this.price, required this.selectedSize, required this.selectedColor, required this.product,required this.productName});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quantity = ref.watch(quantityProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: ElevatedButton(
        onPressed: ()async {
      await FCM.showLocalAndSave(
    title: 'Cart Update',
    body: 'Great choice! $productName is in your cart now at \$${(price * quantity).toStringAsFixed(2)}.',
  );
      ref.read(cartProvider.notifier).addItem(
        CartItem(
          id: product.id,
          name: product.name,
          size: selectedSize,
          color: selectedColor,
          imageUrl: product.images.isNotEmpty ? product.images.first : '',
          price: product.currentPrice,
          quantity: quantity,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.addToBag)),
      );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8E6CEF),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF8E6CEF).withAlpha(150),
          minimumSize: const Size(double.infinity, 56),
        ),
        child: Row(
          children: [
            Text(
              '\$${(price * quantity).toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Text(
              AppLocalizations.of(context)!.addToBag,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
