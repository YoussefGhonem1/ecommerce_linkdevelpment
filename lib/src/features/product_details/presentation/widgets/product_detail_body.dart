import 'package:ecommerce_app/src/features/product_details/presentation/widgets/favorite_button.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_images.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_info_widget.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:flutter/material.dart';

class ProductDetailBody extends StatelessWidget {
  const ProductDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomBackButtonIcon(),
                FavoriteButton(),
              ],
            ),
            SizedBox(height: 16),
            ProductImages(),
            SizedBox(height: 16),
            ProductInfoWidget(),

          ],
        ),
      ),
    );
  }
}


