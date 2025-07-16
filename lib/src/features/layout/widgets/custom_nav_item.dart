import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBarItem extends StatelessWidget {
  final int selectedIndex;
  final int navBarItem;
  final String iconPath;
  const CustomNavBarItem({
    super.key,
    required this.selectedIndex,
    required this.navBarItem,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context) {
    if (selectedIndex == navBarItem) {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SvgPicture.asset(iconPath, color: AppColors.primaryColor,height: 24,),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SvgPicture.asset(iconPath, color: AppColors.darkGrey,height: 24),
      );
    }
  }
}
