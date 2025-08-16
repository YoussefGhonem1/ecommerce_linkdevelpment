class CheckoutState {
  final String? shippingAddress;
  final String? cardNumber;

  CheckoutState({
    this.shippingAddress,
    this.cardNumber,
  });

  CheckoutState copyWith({
    String? shippingAddress,
    String? cardNumber,
  }) {
    return CheckoutState(
      shippingAddress: shippingAddress ?? this.shippingAddress,
      cardNumber: cardNumber ?? this.cardNumber,
    );
  }
}
