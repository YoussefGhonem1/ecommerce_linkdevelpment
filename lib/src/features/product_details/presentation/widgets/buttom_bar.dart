
import 'package:ecommerce_app/src/features/product_details/presentation/manager/quantity_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BottomBar extends ConsumerWidget {
  final double price;

  const BottomBar({super.key, required this.price});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(totalPriceProvider(price));

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF8E6CEF),
          foregroundColor: Colors.white,
          disabledBackgroundColor: const Color(0xFF8E6CEF).withAlpha(150),
          minimumSize: const Size(double.infinity, 56),
        ),
        child: Row(
          children: [
            Text(
              '\$${totalPrice.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
            ),
            const Spacer(),
            Text(
              'Add to Bag',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

