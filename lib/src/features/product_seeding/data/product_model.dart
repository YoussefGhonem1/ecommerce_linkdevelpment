import 'package:ecommerce_app/src/features/product_seeding/data/reviews_model.dart';

class Product {
  final String id;
  final String name;
  final double currentPrice;
  final double? originalPrice;
  final List<String> images;
  final String description;
  final String? ratingcount;
  final String? reviewCount;
  final String categoryId;
  final bool isNewIn;
  final bool isTopSelling;
  final String? userId;
  final List<Review> reviews; 

  Product({
    required this.id,
    required this.name,
    required this.currentPrice,
    required this.originalPrice,
    required this.images,
    required this.description,
    required this.categoryId,
    required this.isNewIn,
    required this.isTopSelling,
    this.userId,
    required this.ratingcount,
    required this.reviewCount,
    this.reviews = const [],
  });

  Map<String, dynamic> toMap() {
    final map = {
      'name': name,
      'currentPrice': currentPrice,
      'originalPrice': originalPrice,
      'images': images,
      'description': description,
      'categoryId': categoryId,
      'isNewIn': isNewIn,
      'isTopSelling': isTopSelling,
      'ratingcount': ratingcount,
      'reviewCount': reviewCount,
      'reviews': reviews.map((r) => r.toMap()).toList(), 
    };
    if (userId != null) map['userId'] = userId;
    return map;
  }

  factory Product.fromMap(Map<String, dynamic> map, String documentId) {
    return Product(
      id: documentId,
      name: map['name'] ?? '',
      currentPrice: (map['currentPrice'] ?? 0).toDouble(),
      originalPrice: map['originalPrice'] != null
          ? (map['originalPrice'] as num).toDouble()
          : null,
      images: List<String>.from(map['images'] ?? []),
      description: map['description'] ?? '',
      categoryId: map['categoryId'] ?? '',
      isNewIn: map['isNewIn'] ?? false,
      isTopSelling: map['isTopSelling'] ?? false,
      userId: map['userId'] as String?,
      ratingcount: map['ratingcount'] as String?,
      reviewCount: map['reviewCount'] as String?,
      reviews: (map['reviews'] as List<dynamic>?)
              ?.map((r) => Review.fromMap(r))
              .toList() ??
          [], 
    );
  }

  Product copyWith({
    String? id,
    String? name,
    double? currentPrice,
    double? originalPrice,
    List<String>? images,
    String? description,
    String? categoryId,
    bool? isNewIn,
    bool? isTopSelling,
    String? userId,
    String? ratingcount,
    String? reviewCount,
    List<Review>? reviews,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      currentPrice: currentPrice ?? this.currentPrice,
      originalPrice: originalPrice ?? this.originalPrice,
      images: images ?? this.images,
      description: description ?? this.description,
      categoryId: categoryId ?? this.categoryId,
      isNewIn: isNewIn ?? this.isNewIn,
      isTopSelling: isTopSelling ?? this.isTopSelling,
      userId: userId ?? this.userId,
      ratingcount: ratingcount ?? this.ratingcount,
      reviewCount: reviewCount ?? this.reviewCount,
      reviews: reviews ?? this.reviews, 
    );
  }
}
