import 'package:ecommerce_app/src/features/shopping_category/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final CategoryModel category;
  final double imageSize;
  final double fontSize;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    required this.imageSize,
    required this.fontSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Image.network(
              category.imagePath,
              height: imageSize,
              width: imageSize,
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
