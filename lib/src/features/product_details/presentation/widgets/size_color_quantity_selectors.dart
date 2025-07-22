import 'package:ecommerce_app/generated/assets.dart';
import 'package:ecommerce_app/src/features/product_details/presentation/manager/quantity_notifier.dart';
import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class SizeColorQuantitySelector extends ConsumerStatefulWidget {
  const SizeColorQuantitySelector({super.key});

  @override
  ConsumerState<SizeColorQuantitySelector> createState() => _SizeColorQuantitySelectorState();
}

class _SizeColorQuantitySelectorState extends ConsumerState<SizeColorQuantitySelector> {
  String selectedSize = 'S';
  String selectedColor = 'Beige';

  final List<String> sizes = ['S', 'M', 'L'];
  final List<String> colors = ['Beige', 'Black', "Olive", 'Brown', 'Blue'];
  final List<Color> colorCodes = [
    const Color.fromARGB(255, 226, 218, 183),
    Colors.black,
    const Color(0xFFB5B381),
    Colors.brown,
    Colors.blue
  ];

  @override
  Widget build(BuildContext context) {
    final quantity = ref.watch(quantityProvider);

    return Column(
      children: [
        /////////////////////////////////////////////////////// SIZE
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Size", style: Theme.of(context).textTheme.bodyMedium),
              Row(
                children: [
                  Text(selectedSize, style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 11),
                  DropdownButton<String>(
                    style: Theme.of(context).textTheme.bodyMedium,
                    underline: const SizedBox(),
                    dropdownColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    icon: SvgPicture.asset(
                      MediaQuery.of(context).platformBrightness == Brightness.dark
                          ? Assets.iconArrowDownLight
                          : Assets.iconArrowDownDark,
                    ),
                    items: sizes.map((size) {
                      return DropdownMenuItem(
                        value: size,
                        child: Text(size),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedSize = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        //////////////////////////////////////////// COLOR
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Color", style: Theme.of(context).textTheme.bodyMedium),
              Row(
                children: [
                  Container(
                    width: 18,
                    height: 18,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorCodes[colors.indexOf(selectedColor)],
                    ),
                  ),
                  const SizedBox(width: 8),
                  DropdownButton<String>(
                    value: selectedColor,
                    style: Theme.of(context).textTheme.bodyMedium,
                    dropdownColor: Theme.of(context).colorScheme.onPrimaryContainer,
                    underline: const SizedBox(),
                    icon: SvgPicture.asset(
                      MediaQuery.of(context).platformBrightness == Brightness.dark
                          ? Assets.iconArrowDownLight
                          : Assets.iconArrowDownDark,
                    ),
                    items: colors.map((color) {
                      return DropdownMenuItem(
                        value: color,
                        child: Text(color),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedColor = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),

        ///////////////////////////////////////////////////////// QUANTITY
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Quantity", style: Theme.of(context).textTheme.bodyMedium),
              Row(
                children: [
                  _circleButton(Assets.iconAdd, () {
                    ref.read(quantityProvider.notifier).increment();
                  }),
                  const SizedBox(width: 12),
                  Text("$quantity", style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(width: 12),
                  _circleButton(Assets.iconMinus, () {
                    ref.read(quantityProvider.notifier).decrement();
                  }),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _circleButton(String image, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 36,
        height: 36,
        decoration: const BoxDecoration(
          color: AppColors.primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(child: SvgPicture.asset(image)),
      ),
    );
  }
}

