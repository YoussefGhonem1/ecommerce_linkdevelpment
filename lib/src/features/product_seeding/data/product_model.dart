class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String categoryId;
  final bool isNewIn;
  final bool isTopSelling;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.isNewIn,
    required this.isTopSelling,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'isNewIn': isNewIn,
      'isTopSelling': isTopSelling,
    };
  }
}
