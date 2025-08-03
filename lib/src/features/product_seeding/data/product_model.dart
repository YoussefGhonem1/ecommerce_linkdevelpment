class Product {
  final String id;
  final String name;
  final double currentPrice;
  final double? originalPrice;
  final List<String> images; 
  final String categoryId;
  final bool isNewIn;
  final bool isTopSelling;

  Product({
    required this.id,
    required this.name,
    required this.currentPrice,
    required this.originalPrice,
    required this.images,
    required this.categoryId,
    required this.isNewIn,
    required this.isTopSelling,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'currentPrice': currentPrice,
      'originalPrice': originalPrice,
      'images': images,
      'categoryId': categoryId,
      'isNewIn': isNewIn,
      'isTopSelling': isTopSelling,
    };
  }
  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
  return Product(
    id: documentId,
    name: map['name'] ?? '',
    currentPrice: map['currentPrice'] ?? 0.0,
    originalPrice: map['originalPrice'] ?? 0.0,
    images: List<String>.from(map['images'] ?? []),
    categoryId: map['categoryId'] ?? '',
    isNewIn: map['isNewIn'] ?? false,
    isTopSelling: map['isTopSelling'] ?? false,
  );
}
}
