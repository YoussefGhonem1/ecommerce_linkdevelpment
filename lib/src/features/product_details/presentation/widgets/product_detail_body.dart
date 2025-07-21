import 'package:ecommerce_app/src/features/product_details/presentation/widgets/favorite_button.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_images.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_info_widget.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/size_color_quantity_selectors.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:flutter/material.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({super.key});

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
              children: const [CustomBackButtonIcon(), FavoriteButton()],
            ),
            SizedBox(height: 16),
            ProductImages(),
            SizedBox(height: 16),
            ProductInfoWidget(),
            SizedBox(height: 16),
            SizeColorQuantitySelector(),
            SizedBox(height: 16),
            Text(
              'Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless. ',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 16),
            Text(
              'Shipping & Returns',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: 'Gabarito'),
            ),
            SizedBox(height: 4),
            Text('Free standard shipping and free 60-day returns',style: Theme.of(context).textTheme.bodySmall,),
          ],
        ),
      ),
    );
  }
}
