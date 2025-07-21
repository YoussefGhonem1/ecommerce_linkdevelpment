import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ProductImages extends StatefulWidget {
  const ProductImages();

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedIndex = 0;
  final List<String> images = [
    'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905755574570.jpg?v=1715744736&width=1080',
    'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743647018.jpg?v=1715744424&width=1080',
    'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743974698.jpg?v=1715744430&width=1080',
    'https://andsons.co.uk/cdn/shop/files/RebelJacketStoneLSMOBILE6.jpg',
    'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905755574570.jpg?v=1715744736&width=1080',
    'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743647018.jpg?v=1715744424&width=1080',
    'https://ashanderie.com/cdn/shop/files/harrington-jacket-khaki-harrington-jacket-44905743974698.jpg?v=1715744430&width=1080',
    'https://andsons.co.uk/cdn/shop/files/RebelJacketStoneLSMOBILE6.jpg',

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,    
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: images.length,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              width: isSelected ? 160 : 120,
              height: isSelected ? 248 : 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isSelected ? AppColors.primaryColor: Colors.transparent,
                  width: 3,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    images[index],
                    ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
