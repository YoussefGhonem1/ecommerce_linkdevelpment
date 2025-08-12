import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_provider.dart';
import 'package:ecommerce_app/src/shared/components/product_card.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchResults = ref.watch(filteredProductsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color:
                  Theme.of(context).inputDecorationTheme.fillColor ??
                  Colors.grey[200],
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: Theme.of(context).iconTheme.color),
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                    decoration: const InputDecoration(
                      hintText: "Search products...",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      isCollapsed: true,
                    ),
                    onChanged: (value) {
                      ref.read(searchQueryProvider.notifier).state = value;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: searchResults.when(
        data: (products) {
          if (products.isEmpty) {
            return const Center(child: Text("No products found"));
          }
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                product: product,
                width: double.infinity,
                height: 250,
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
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text("Error: $err")),
      ),
    );
  }
}
