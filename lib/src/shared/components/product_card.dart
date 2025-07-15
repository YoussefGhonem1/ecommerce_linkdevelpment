import 'package:ecommerce_app/src/shared/components/product_image.dart';
import 'package:ecommerce_app/src/shared/components/product_info.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final double width;
  final double height;
  final String imageUrl;
  final String productName;
  final double currentPrice;
  final double? originalPrice;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.productName,
    required this.currentPrice,
    this.originalPrice,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.darkGrey : AppColors.lightGrey,
          borderRadius: BorderRadius.circular(18.0),
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
            ProductImage(imageUrl: imageUrl, onFavoriteTap: onFavoriteTap),
            ProductInfo(
              productName: productName,
              currentPrice: currentPrice,
              originalPrice: originalPrice,
              theme: theme,
            ),
          ],
        ),
      ),
    );
  }
}
 
//example to check the card
 /*            ProductCard(
                width: 200,
                height: 310,
                productName: "Men's Harringiton Jacket",
                imageUrl:
                    'https://drive.google.com/uc?export=view&id=1WMqdrPBbIqk8aamWW6AGKVQKiwBTAiCg',
                currentPrice: 55.00,
                originalPrice: 100.00,
                onTap: () {},
                onFavoriteTap: () {},
              ), */