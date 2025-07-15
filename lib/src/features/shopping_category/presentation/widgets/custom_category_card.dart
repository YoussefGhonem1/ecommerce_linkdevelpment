import 'package:ecommerce_app/src/features/shopping_category/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final double imageSize;
  final double fontSize;
  final VoidCallback? onTap;

  const CategoryCard({
    Key? key,
    required this.category,
    this.imageSize = 40,
    this.fontSize = 16,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.asset(
              category.imagePath,
              height: 40,
              width: 40,
            ),
            const SizedBox(width: 16),
            Text(
              category.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: fontSize,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
