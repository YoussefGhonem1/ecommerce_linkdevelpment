import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/product_card.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:flutter/material.dart';

class ProductsByCategoryScreen extends StatelessWidget {
  final String categoryTitle;
  const ProductsByCategoryScreen({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: const CustomBackButtonIcon(),
              ),
              Text(
                '$categoryTitle (${ProductModel.products.length})',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.builder(
                  itemCount: ProductModel.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3 / 5,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                      width: 0, //not used
                      height: 0, //not used
                      product: ProductModel.products[index],
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.productDetailScreen,
                        );
                      },
                      onFavoriteTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
