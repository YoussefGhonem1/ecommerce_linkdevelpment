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



final testCartItems = [
  CartItem(
    id: '1',
    name: "Men's Harrington Jacket",
    size: "M",
    color: "Black",
    price: 150.0,
    imageUrl:
        'https://drive.google.com/uc?export=view&id=1WMqdrPBbIqk8aamWW6AGKVQKiwBTAiCg',
    quantity: 1,
  ),
  CartItem(
    id: '2',
    name: "Men's Harrington Jacket",
    price: 250.0,
    size: "M",
    color: "Black",
    imageUrl:
        'https://drive.google.com/uc?export=view&id=1WMqdrPBbIqk8aamWW6AGKVQKiwBTAiCg',
    quantity: 1,
  ),
];
