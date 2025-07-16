import 'package:ecommerce_app/core/app_constants.dart';
import 'package:ecommerce_app/src/features/shopping_category/data/models/category_model.dart';
import 'package:ecommerce_app/src/shared/components/custom_card.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:flutter/material.dart';


class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                style: Theme.of(context).textTheme.headlineSmall
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: CategoryModel.categories.length,
                  itemBuilder: (context, index) {
                    return CustomCardSize(
                      category: CategoryModel.categories[index],
                      imageSize: categoryImageSize,
                      fontSize:CategoryFontSize,
                      onTap: () {
                       // Navigation.pushNamed(context, Routes.);
                      },
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
