class Product {
  final String id;
  final String name;
  final double currentPrice;
  final double? originalPrice;
  final List<String> images;
  final String categoryId;
  final bool isNewIn;
  final bool isTopSelling;
  final String? userId;

  Product({
    required this.id,
    required this.name,
    required this.currentPrice,
    required this.originalPrice,
    required this.images,
    required this.categoryId,
    required this.isNewIn,
    required this.isTopSelling,
    this.userId,
  });

  Map<String, dynamic> toMap() {
    final map = {
      'name': name,
      'currentPrice': currentPrice,
      'originalPrice': originalPrice,
      'images': images,
      'categoryId': categoryId,
      'isNewIn': isNewIn,
      'isTopSelling': isTopSelling,
    };
    if (userId != null) map['userId'] = userId;
    return map;
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      name: map['name'] ?? '',
      currentPrice: (map['currentPrice'] ?? 0).toDouble(),
      originalPrice: map['originalPrice'] != null ? (map['originalPrice'] as num).toDouble() : null,
      images: List<String>.from(map['images'] ?? []),
      categoryId: map['categoryId'] ?? '',
      isNewIn: map['isNewIn'] ?? false,
      isTopSelling: map['isTopSelling'] ?? false,
      userId: map['userId'] as String?,
    );
  }
  Product copyWith({
    String? id,
    String? name,
    double? currentPrice,
    double? originalPrice,
    List<String>? images,
    String? categoryId,
    bool? isNewIn,
    bool? isTopSelling,
    String? userId,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      currentPrice: currentPrice ?? this.currentPrice,
      originalPrice: originalPrice ?? this.originalPrice,
      images: images ?? this.images,
      categoryId: categoryId ?? this.categoryId,
      isNewIn: isNewIn ?? this.isNewIn,
      isTopSelling: isTopSelling ?? this.isTopSelling,
      userId: userId ?? this.userId,
    );
  }
}

