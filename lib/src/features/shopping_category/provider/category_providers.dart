// category_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/category_model.dart';
import '../repository/category_repository.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_repository.dart';

final categoryRepositoryProvider = Provider((ref) => CategoryRepository());
final productRepositoryProvider = Provider((ref) => ProductRepository());

final categoriesProvider = FutureProvider<List<CategoryModel>>((ref) async {
  final repo = ref.read(categoryRepositoryProvider);
  return await repo.fetchCategories();
});

final categorySearchQueryProvider = StateProvider<String>((ref) => '');

final filteredProductsProvider = FutureProvider<List<Product>>((ref) async {
  final query = ref.watch(categorySearchQueryProvider);
  if (query.isEmpty) return [];

  final repo = ref.read(productRepositoryProvider);
  final allProducts = await repo.fetchAllProducts();

  return allProducts
      .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
      .toList();
});
