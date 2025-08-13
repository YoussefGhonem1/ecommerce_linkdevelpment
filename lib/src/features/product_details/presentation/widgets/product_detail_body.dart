import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/favorite_button.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_images.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_info_widget.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/reviews_section.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/size_color_quantity_selectors.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:ecommerce_app/src/shared/components/custom_back_button.dart';
import 'package:flutter/material.dart';

class ProductDetailBody extends StatefulWidget {
  const ProductDetailBody({super.key, required this.product, this.onSizeChanged, this.onColorChanged});
  final Product product;
  final ValueChanged<String>? onSizeChanged;
  final ValueChanged<String>? onColorChanged;
  @override
  State<ProductDetailBody> createState() => _ProductDetailBodyState();
}

class _ProductDetailBodyState extends State<ProductDetailBody> {
  String selectedSize = 'S';
  String selectedColor = 'Beige';
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
              children:  [CustomBackButtonIcon(), FavoriteButton(product: widget.product,)],
            ),
            SizedBox(height: 16),
            ProductImages(images: widget.product.images,),
            SizedBox(height: 16),
            ProductInfoWidget(name: widget.product.name, currentPrice: widget.product.currentPrice,),
            SizedBox(height: 16),
            SizeColorQuantitySelector(
              onSizeChanged: (size) {
                setState(() => selectedSize = size);
                if (widget.onSizeChanged != null) widget.onSizeChanged!(size);
              },
              onColorChanged: (color) {
                setState(() => selectedColor = color);
                if (widget.onColorChanged != null) widget.onColorChanged!(color);
              },
            ),
            SizedBox(height: 16),
            Text(
              widget.product.description,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: 16),
            Text(
              AppLocalizations.of(context)!.shippingAndReturns,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: 'Gabarito'),
            ),
            SizedBox(height: 4),
            Text(AppLocalizations.of(context)!.shippingAndReturnsDescription,style: Theme.of(context).textTheme.bodySmall,),
            SizedBox(height: 16),
            ReviewsSection(product: widget.product,),
          ],
        ),
      ),
    );
  }
}


