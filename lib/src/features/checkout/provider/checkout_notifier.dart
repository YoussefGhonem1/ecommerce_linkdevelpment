import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'checkout_state.dart';

class CheckoutNotifier extends StateNotifier<CheckoutState> {
  CheckoutNotifier() : super(CheckoutState());

  void setShippingAddress(String address) {
    state = state.copyWith(shippingAddress: address);
  }

  void setCardNumber(String card) {
    state = state.copyWith(cardNumber: card);
  }
}

final checkoutProvider =
StateNotifierProvider<CheckoutNotifier, CheckoutState>(
      (ref) => CheckoutNotifier(),
);