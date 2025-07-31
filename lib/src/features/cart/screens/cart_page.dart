import 'package:ecommerce_app/src/features/cart/screens/empty_cart_page.dart';
import 'package:ecommerce_app/src/features/cart/screens/full_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/src/features/cart/controllers/cart_controller.dart'; // المسار حسب مشروعك

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartProvider);
    return cartItems.isEmpty ? EmptyCartPage() : FullCartPage();
  }
}
