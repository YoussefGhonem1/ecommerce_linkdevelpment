import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/src/features/my_favourits/provider/favouriteProductsProvider.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:ecommerce_app/src/shared/components/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../product_seeding/data/product_model.dart';

class MyFavouritScreen extends ConsumerStatefulWidget {
  const MyFavouritScreen({super.key});

  @override
  ConsumerState<MyFavouritScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends ConsumerState<MyFavouritScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(favouriteProductsProvider.notifier).loadFavourites();
    });
  }

  @override
  Widget build(BuildContext context) {
    final favourites = ref.watch(favouriteProductsProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  CustomBackButtonIcon(),
                  const SizedBox(width: 58),
                  Text(
                  '${AppLocalizations.of(context)!.myFavourites} (${favourites.length})',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: favourites.isEmpty
                  ? const Center(child: Text('No favourites yet'))
                  : GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: favourites.length,
                      itemBuilder: (context, index) {
                        final Product product = favourites[index];
                        return ProductCard(
                          product: product,
                          width: double.infinity,
                          height: 250,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
