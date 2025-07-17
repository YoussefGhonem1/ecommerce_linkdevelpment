import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final String productName;
  final double currentPrice;
  final double? originalPrice;

  const ProductInfo({super.key, 
    required this.productName,
    required this.currentPrice,
    required this.originalPrice,
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
            productName,
            style: theme.appBarTheme.titleTextStyle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '\$${currentPrice.toStringAsFixed(2)}',
                style: theme.appBarTheme.titleTextStyle,
              ),
              const SizedBox(width: 8),
              if (originalPrice != null)
                Text(
                  '\$${originalPrice!.toStringAsFixed(2)}',
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
