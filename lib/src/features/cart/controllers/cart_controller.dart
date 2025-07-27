import 'package:ecommerce_app/src/features/cart/models/cart_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, List<CartItem>>(
  (ref) => CartNotifier(),
);

class CartNotifier extends StateNotifier<List<CartItem>> {
  CartNotifier() : super(testCartItems);

  void increaseQuantity(String id) {
    state = [
      for (final item in state)
        if (item.id == id) item.copyWith(quantity: item.quantity + 1) else item,
    ];
  }

  void decreaseQuantity(String id) {
    state = [
      for (final item in state)
        if (item.id == id && item.quantity > 1)
          item.copyWith(quantity: item.quantity - 1)
        else if (item.id == id && item.quantity == 1)
          removeItem(id)
        else
          item,
    ];
  }

  removeItem(String id) {
    state = state.where((item) => item.id != id).toList();
  }

  void clearCart() {
    state = [];
  }

  double get subtotal =>
      state.fold(0, (sum, item) => sum + item.price * item.quantity);
  double get shipping => 8.0;
  double get tax => 0.0;
  double get total => subtotal + shipping + tax;
}
