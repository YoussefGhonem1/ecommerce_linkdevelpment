import 'package:ecommerce_app/src/shared/routing/app_routes.dart' show Routes;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/category_providers.dart';
import 'category_circle_card.dart';

class CategoriesRowSection extends ConsumerWidget {
  const CategoriesRowSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider);

    return categoriesAsync.when(
      data:
          (categories) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    GestureDetector(
                      onTap:
                          () =>
                              Navigator.pushNamed(context, Routes.categoryPage),
                      child: Text(
                        "See All",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 110,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryCircleCard(
                      category: categories[index],
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
      loading:
          () => const SizedBox(
            height: 110,
            child: Center(child: CircularProgressIndicator()),
          ),
      error: (err, _) => Text("Error: $err"),
    );
  }
}
