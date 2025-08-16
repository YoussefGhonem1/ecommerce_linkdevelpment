import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final newInProductsProvider = FutureProvider<List<Product>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchProductsBySection('isNewIn');
});

final topSellingProductsProvider = FutureProvider<List<Product>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchProductsBySection('isTopSelling');
});

final allProductsProvider = FutureProvider<List<Product>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return repository.fetchAllProducts();
});

final searchQueryProvider = StateProvider<String>((ref) => "");

final filteredProductsProvider = FutureProvider<List<Product>>((ref) async {
  final query = ref.watch(searchQueryProvider);
  final repo = ref.watch(productRepositoryProvider);

  if (query.isEmpty) {
    return [];
  } else {
    final allProducts = await repo.fetchAllProducts();
    return allProducts
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
});

final categoryProductsSearchQueryProvider = StateProvider<String>((ref) => '');

final filteredCategoryProductsProvider = FutureProvider<List<Product>>((
  ref,
) async {
  final query = ref.watch(categoryProductsSearchQueryProvider);
  final repo = ref.watch(productRepositoryProvider);

  // get all products
  final allProducts = await repo.fetchAllProducts();

  if (query.isEmpty) return allProducts;

  return allProducts
      .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
      .toList();
});
