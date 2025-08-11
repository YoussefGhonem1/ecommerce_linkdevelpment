import 'package:ecommerce_app/src/features/product_details/presentation/widgets/favorite_button.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_images.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_info_widget.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/reviews_section.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/size_color_quantity_selectors.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:flutter/material.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [CustomBackButtonIcon(), FavoriteButton(product: product,)],
            ),
            SizedBox(height: 16),
            ProductImages(images: product.images,),
            SizedBox(height: 16),
            ProductInfoWidget(name: product.name, currentPrice: product.currentPrice,),
            SizedBox(height: 16),
            SizeColorQuantitySelector(),
            SizedBox(height: 16),
            Text(
              product.description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 16),
            Text(
              'Shipping & Returns',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: 'Gabarito'),
            ),
            SizedBox(height: 4),
            Text('Free standard shipping and free 60-day returns',style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: 16),
            ReviewsSection(product: product,),
            
          
          ],
        ),
      ),
    );
  }
}


