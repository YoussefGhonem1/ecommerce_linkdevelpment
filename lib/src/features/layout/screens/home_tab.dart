import 'package:ecommerce_app/src/features/layout/widgets/gender_drop_down.dart';
import 'package:ecommerce_app/src/features/shopping_category/presentation/widgets/category_circle_card.dart';
import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:ecommerce_app/src/shared/components/product_card.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../generated/assets.dart';
import '../../shopping_category/data/models/category_model.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Image.asset(Assets.imagesProfileImage),
        ),
        title: GenderDropdown(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.primaryColor,
              ),
              child: SvgPicture.asset(Assets.iconsCart, width: 16),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories", style: theme.textTheme.headlineSmall),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.categoryPage);
                      },
                      child: Text("See All", style: theme.textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  itemCount: CategoryModel.categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          Routes.productsByCategoryScreen,
                          arguments: CategoryModel.categories[index].title,
                        );
                      },
                      child: CategoryCircleCard(
                        category: CategoryModel.categories[index],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Top Selling", style: theme.textTheme.headlineSmall),
                    GestureDetector(
                      onTap: () {},
                      child: Text("See All", style: theme.textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  itemCount: ProductModel.products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      width: 160,
                      height: 280,
                      product: ProductModel.products[index],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "New In",
                      style: theme.textTheme.headlineSmall?.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text("See All", style: theme.textTheme.bodyMedium),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  itemCount: ProductModel.products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      width: 160,
                      height: 280,
                      product: ProductModel.products[index],
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
