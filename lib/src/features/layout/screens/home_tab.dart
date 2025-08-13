import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/src/features/layout/widgets/gender_drop_down.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_provider.dart';
import 'package:ecommerce_app/src/features/shopping_category/presentation/widgets/category_circle_card.dart';
import 'package:ecommerce_app/src/features/shopping_category/provider/category_providers.dart'
    hide filteredProductsProvider;
import 'package:ecommerce_app/src/shared/components/loading_screen.dart';
import 'package:ecommerce_app/src/shared/components/product_card.dart';
import 'package:ecommerce_app/src/shared/routing/app_routes.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../generated/assets.dart';
import 'package:ecommerce_app/src/shared/components/custom_search_bar.dart';


class HomeTab extends ConsumerStatefulWidget {
  const HomeTab({super.key});

  @override
  ConsumerState<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends ConsumerState<HomeTab> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _preloadImages();
  }

  Future<void> _preloadImages() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final photoUrl = user?.photoURL ?? '';
    final theme = Theme.of(context);

    final topSellingAsync = ref.watch(topSellingProductsProvider);
    final newInAsync = ref.watch(newInProductsProvider);
    final query = ref.watch(searchQueryProvider);
    final searchResultsAsync = ref.watch(filteredProductsProvider);
    final local = AppLocalizations.of(context)!;

    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: CircleAvatar(
              radius: 36,
              backgroundColor: AppColors.primaryColor.withOpacity(0.2),
              backgroundImage:
                  photoUrl.isNotEmpty ? NetworkImage(photoUrl) : null,
              child:
                  photoUrl.isEmpty
                      ? Icon(
                        Icons.person,
                        size: 40,
                        color: AppColors.primaryColor,
                      )
                      : null,
            ),
          ),
          title: GenderDropdown(),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.cartPage);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.primaryColor,
                  ),
                  child: SvgPicture.asset(Assets.iconsCart, width: 16),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // 🔍 Search Bar
                CustomSearchBar(
                  onChanged: (value) {
                    ref.read(searchQueryProvider.notifier).state = value;
                  },
                ),

                const SizedBox(height: 10),

                // If searching, show search results
                if (query.isNotEmpty) ...[
                  searchResultsAsync.when(
                    data: (products) {
                      if (products.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text("No results found"),
                        );
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.7,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                        itemBuilder: (context, index) {
                          final product = products[index];
                          return ProductCard(
                            width: 160,
                            height: 280,
                            product: product,
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                Routes.productDetailScreen,
                                arguments: product,
                              );
                            },
                          );
                        },
                      );
                    },
                    loading:
                        () => const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: CircularProgressIndicator(),
                        ),
                    error:
                        (e, _) => Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text("Error: $e"),
                        ),
                  ),
                  const SizedBox(height: 20),
                ] else ...[
                  // Categories section
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          local.categories,
                          style: theme.textTheme.headlineSmall,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.categoryPage);
                          },
                          child: Text(
                            local.seeAll,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer(
                    builder: (context, ref, _) {
                      final categoriesAsync = ref.watch(categoriesProvider);
                      return categoriesAsync.when(
                        data:
                            (categories) => SizedBox(
                              height: 120,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: categories.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        Routes.productsByCategoryScreen,
                                        arguments: categories[index].title,
                                      );
                                    },
                                    child: CategoryCircleCard(
                                      category: categories[index],
                                    ),
                                  );
                                },
                              ),
                            ),
                        loading:
                            () => const SizedBox(
                              height: 120,
                              child: Center(child: CircularProgressIndicator()),
                            ),
                        error:
                            (err, _) => SizedBox(
                              height: 120,
                              child: Center(child: Text("Error: $err")),
                            ),
                      );
                    },
                  ),

                  // Top Selling
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          local.topSelling,
                          style: theme.textTheme.headlineSmall,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            local.seeAll,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  topSellingAsync.when(
                    data:
                        (products) => SizedBox(
                          height: 280,
                          child: ListView.builder(
                            itemCount: products.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                width: 160,
                                height: 280,
                                product: products[index],
                                onTap:
                                    () => Navigator.pushNamed(
                                      context,
                                      Routes.productDetailScreen,
                                      arguments: products[index],
                                    ),
                              );
                            },
                          ),
                        ),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Text("Error loading top selling: $e"),
                  ),

                  // New In
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          local.newIn,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            local.seeAll,
                            style: theme.textTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                  ),
                  newInAsync.when(
                    data:
                        (products) => SizedBox(
                          height: 280,
                          child: ListView.builder(
                            itemCount: products.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return ProductCard(
                                width: 160,
                                height: 280,
                                product: products[index],
                                onTap:
                                    () => Navigator.pushNamed(
                                      context,
                                      Routes.productDetailScreen,
                                      arguments: products[index],
                                    ),
                              );
                            },
                          ),
                        ),
                    loading:
                        () => const Center(child: CircularProgressIndicator()),
                    error: (e, _) => Text("Error loading new in: $e"),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
