import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductInfoWidget extends StatelessWidget {
  const ProductInfoWidget({
    super.key,
    required this.name,
    required this.currentPrice,
  });
  final String name;
  final double currentPrice;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontFamily: 'Gabarito')),
        SizedBox(height: 8),
        Text(currentPrice.toString(), style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: AppColors.primaryColor, fontFamily: 'Gabarito')),
      ],
    );
  }
}
