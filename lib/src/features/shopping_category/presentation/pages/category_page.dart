import 'package:ecommerce_app/core/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/category_providers.dart';
import 'package:ecommerce_app/src/features/shopping_category/presentation/widgets/category_dart.dart';
import 'package:ecommerce_app/src/shared/components/product_card.dart';
import 'package:ecommerce_app/src/shared/components/custom_search_bar.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchQuery = ref.watch(categorySearchQueryProvider);
    final categoriesAsync = ref.watch(categoriesProvider);
    final productsAsync = ref.watch(filteredProductsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                children: [
                  const CustomBackButtonIcon(),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomSearchBar(
                      hintText: "Search products...",
                      onChanged: (value) {
                        ref.read(categorySearchQueryProvider.notifier).state =
                            value;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Title (below the row)
              Text(
                searchQuery.isEmpty ? "Shop by Categories" : "Search Results",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),

              // Main content
              Expanded(
                child:
                    searchQuery.isEmpty
                        ? categoriesAsync.when(
                          data:
                              (categories) => ListView.builder(
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  final category = categories[index];
                                  return CategoryCard(
                                    category: category,
                                    imageSize: categoryImageSize,
                                    fontSize: 16,
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.productsByCategoryScreen,
                                        arguments: category.title,
                                      );
                                    },
                                  );
                                },
                              ),
                          loading:
                              () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          error: (err, _) => Center(child: Text("Error: $err")),
                        )
                        : productsAsync.when(
                          data: (products) {
                            if (products.isEmpty) {
                              return const Center(
                                child: Text("No products found"),
                              );
                            }
                            return GridView.builder(
                              itemCount: products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                  ),
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return ProductCard(
                                  product: product,
                                  width: 160,
                                  height: 280,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      Routes.productDetailScreen,
                                      arguments: product,
                                    );
                                  },
                                );
                              },
                            );
                          },
                          loading:
                              () => const Center(
                                child: CircularProgressIndicator(),
                              ),
                          error: (err, _) => Center(child: Text("Error: $err")),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
