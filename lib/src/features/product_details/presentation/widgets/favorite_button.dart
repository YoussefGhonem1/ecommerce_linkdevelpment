import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/src/features/my_favouits/provider/favorite_products_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoriteButton extends ConsumerWidget {
  final Product product;
  const FavoriteButton({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    final isFav = ref.watch(favouriteProductsProvider)
        .any((p) => p.id == product.id);

    return GestureDetector(
      onTap: () {
        final user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          ref.read(favouriteProductsProvider.notifier)
             .toggleFavourite(product);
        }
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            isFav
                ? Assets.iconHeartRed
                : (isDarkMode
                    ? Assets.iconHeartLight
                    : Assets.iconHeartDark),
            height: 24,
            width: 24,
          ),
        ),
      ),
    );
  }
}
