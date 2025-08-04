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
