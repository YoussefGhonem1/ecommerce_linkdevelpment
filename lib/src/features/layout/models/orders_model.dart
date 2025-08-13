import '../../cart/models/cart_item.dart';

class OrdersModel {
  final String id;
  final List<CartItem> items;
  final String shippingAddress;
  final String paymentMethod;
  final DateTime date;

  OrdersModel({
    required this.id,
    required this.items,
    required this.shippingAddress,
    required this.paymentMethod,
    required this.date,
  });

  double get total =>
      items.fold(0, (sum, item) => sum + item.price * item.quantity);
}
