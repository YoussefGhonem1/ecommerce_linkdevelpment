class CartItem {
  final String id;
  final String name;
  final String size;
  final String color;
  final String imageUrl;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.size,
    required this.color,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  CartItem copyWith({
    int? quantity,
  }) {
    return CartItem(
      id: id,
      name: name,
      size: size,
      color: color,
      imageUrl: imageUrl,
      price: price,
      quantity: quantity ?? this.quantity,
    );
  }
}

