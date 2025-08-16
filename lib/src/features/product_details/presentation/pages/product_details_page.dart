import 'package:ecommerce_app/src/features/product_details/presentation/widgets/buttom_bar.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/widgets/product_detail_body.dart';
import 'package:ecommerce_app/src/features/product_seeding/data/product_model.dart';
import 'package:ecommerce_app/src/shared/components/loading_screen.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, required this.product});
  final Product product;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool _isLoading = true;
  String _selectedSize = 'S';
  String _selectedColor = 'Beige';
  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
    }
  }

  void _onSizeChanged(String size) {
    setState(() => _selectedSize = size);
  }

  void _onColorChanged(String color) {
    setState(() => _selectedColor = color);
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: _isLoading,
      child: Scaffold(
        bottomNavigationBar: BottomBar(
          price: widget.product.currentPrice,
          selectedSize: _selectedSize,
          selectedColor: _selectedColor,
          product: widget.product,
          productName: widget.product.name,
        ),
        body: ProductDetailBody(
          product: widget.product,
          onSizeChanged: _onSizeChanged,
          onColorChanged: _onColorChanged,
        ),
      ),
    );
  }
}
