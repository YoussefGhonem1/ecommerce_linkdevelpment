import 'product_model.dart';
import 'product_repository.dart';
import 'package:ecommerce_app/src/features/product_seeding/utils/generate_slug.dart';

final sampleProducts = [
  Product(
    id: generateSlug("Men's Harringiton Jacket"),
    name: "Men's Harringiton Jacket",
    price: 148.00,
    imageUrl: "https://ibb.co/dJtTYSN4",
    categoryId: "clothes",
    isNewIn: true,
    isTopSelling: false,
  ),
  Product(
    id: generateSlug("Air Max Sneakers"),
    name: "Air Max Sneakers",
    price: 55.00,
    imageUrl: "https://ibb.co/WWRBpL5P",
    categoryId: "shoes",
    isNewIn: false,
    isTopSelling: true,
  ),
];

Future<void> seedProducts() async {
  final service = ProductRepository();
  for (var product in sampleProducts) {
    await service.addProduct(product);
  }
}
