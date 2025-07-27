class CheckoutModel {
  final double subtotal;
  final double shippingCost;
  final double tax;
  final double total;

  CheckoutModel({
    required this.subtotal,
    required this.shippingCost,
    required this.tax,
    required this.total,
  });
}

CheckoutModel testCheckout = CheckoutModel(
  subtotal: 200,
  shippingCost: 8,
  tax: 0,
  total: 208,
);
