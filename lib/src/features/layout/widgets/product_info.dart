import 'package:ecommerce_app/src/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
   final ProductModel product;

  const ProductInfo({super.key, 
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 0, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            product.productName,
            style: theme.appBarTheme.titleTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$${product.currentPrice.toStringAsFixed(2)}',
                style: theme.appBarTheme.titleTextStyle,
              ),
              const SizedBox(width: 8),
              if (product.originalPrice != null)
                Text(
                  '\$${product.originalPrice!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
