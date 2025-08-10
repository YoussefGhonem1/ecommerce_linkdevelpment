import 'package:ecommerce_app/src/features/my_favouits/provider/favorite_products_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce_app/src/features/layout/widgets/product_image.dart';
import 'package:ecommerce_app/src/features/layout/widgets/product_info.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ProductCard extends StatelessWidget {
  final Product product;
  final double width;
  final double height;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.width,
    required this.height,
    this.onTap,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: theme.cardColor,
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
            Consumer(
              builder: (context, ref, _) {
                final isFav = ref.watch(favouriteProductsProvider)
                    .any((p) => p.id == product.id);
                return ProductImage(
                  imageUrl: product.images[0],
                  isFavourite: isFav,
                  onFavoriteTap: () {
                    final user = FirebaseAuth.instance.currentUser;
                    if (user != null) {
                      ref
                          .read(favouriteProductsProvider.notifier)
                          .toggleFavourite(product);
                    }
                  },
                );
              },
            ),
            ProductInfo(product: product),
          ],
        ),
      ),
    );
  }
}
