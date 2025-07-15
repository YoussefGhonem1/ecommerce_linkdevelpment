import 'package:ecommerce_app/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomBackButtonIcon extends StatelessWidget {
  const CustomBackButtonIcon({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:8),
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              Assets.imagesArrowBack,
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}
