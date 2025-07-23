import 'package:ecommerce_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              isDarkMode
                  ? Assets.iconHeartLight
                  : Assets.iconHeartDark,
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
