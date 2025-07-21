import 'package:ecommerce_app/src/features/product_details/presentation/widgets/buttom_bar.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_detail_body.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomBar(),
      body: const ProductDetailBody(),
    );
  }
}
