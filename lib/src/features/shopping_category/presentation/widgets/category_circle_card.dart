import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/features/shopping_category/models/category_model.dart';

class CategoryCircleCard extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;
  
  const CategoryCircleCard({
    Key? key,
    required this.category,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF5F5F5),
            ),
            child: Image.network(
              category.imagePath,
              height: 50,
              width: 50,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            category.title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
