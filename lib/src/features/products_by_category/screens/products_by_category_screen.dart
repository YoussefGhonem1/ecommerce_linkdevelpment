import 'package:ecommerce_app/src/features/product_seeding/data/product_provider.dart';
import 'package:ecommerce_app/src/shared/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';


class ProductsByCategoryScreen extends ConsumerWidget {
  final String categoryTitle;

  const ProductsByCategoryScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final productsAsync = ref.watch(allProductsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: CustomBackButtonIcon(),
              ),
              Text(
                categoryTitle,
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: productsAsync.when(
                  data: (products) {
                    final filteredProducts = products
                        .where((product) => product.categoryId == categoryTitle)
                        .toList();

                    return GridView.builder(
                      itemCount: filteredProducts.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 3 / 5,
                      ),
                      itemBuilder: (context, index) {
                        final product = filteredProducts[index];
                        return ProductCard(
                          width: 0,
                          height: 0,
                          product: product,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.productDetailScreen,
                              arguments: product, 
                            );
                          },
                          onFavoriteTap: () {},
                        );
                      },
                    );
                  },
                  loading: () => const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(child: Text('Error: $e')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
