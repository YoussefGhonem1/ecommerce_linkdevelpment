import 'package:ecommerce_app/src/features/layout/widgets/product_image.dart';
import 'package:ecommerce_app/src/features/layout/widgets/product_info.dart';
import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final double width;
  final double height;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.width,
    required this.height,
    this.onTap,
    this.onFavoriteTap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkGrey : AppColors.lightGrey,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(
              imageUrl: product.imageUrl,
              onFavoriteTap: onFavoriteTap,
            ),
            ProductInfo(
              product: product,
            ),
          ],
        ),
      ),
    );
  }
}
