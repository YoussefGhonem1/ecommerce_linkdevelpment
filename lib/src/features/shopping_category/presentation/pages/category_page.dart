import 'package:ecommerce_app/core/app_constants.dart';
import 'package:ecommerce_app/src/features/shopping_category/presentation/widgets/category_dart.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/category_providers.dart'; 

class CategoriesPage extends ConsumerWidget {
  const CategoriesPage({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesAsync = ref.watch(categoriesProvider); 
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const CustomBackButtonIcon(),
              const SizedBox(height: 16),
              Text(
                "Shop by Categories",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20),
              Expanded(

                child: categoriesAsync.when(
                  data: (categories) => ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        category: categories[index],
                        imageSize: categoryImageSize,
                        fontSize: 16,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.productsByCategoryScreen,
                            arguments: categories[index].title,
                          );
                        },
                      );
                    },
                  ),
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
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
