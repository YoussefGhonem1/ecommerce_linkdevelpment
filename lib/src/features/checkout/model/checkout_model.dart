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
