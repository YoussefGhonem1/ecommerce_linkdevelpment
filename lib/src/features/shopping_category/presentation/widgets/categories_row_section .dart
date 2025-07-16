import 'package:ecommerce_app/src/shared/routing/app_routes.dart' show Routes;
import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/features/shopping_category/data/models/category_model.dart';
import 'category_circle_card.dart'; 

class CategoriesRowSection extends StatelessWidget {
  const CategoriesRowSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Categories", style: Theme.of(context).textTheme.headlineSmall),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, Routes.categoryPage),
                child: Text("See All", style: Theme.of(context).textTheme.bodyMedium),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 110,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: CategoryModel.categories.length,
            itemBuilder: (context, index) {
              return CategoryCircleCard(
                category: CategoryModel.categories[index],
                onTap: () {
                  // Navigator.pushNamed(context, Routes.categoryPage);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
