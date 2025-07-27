import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CouponCodeCard extends ConsumerWidget {
  const CouponCodeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.darkGrey : AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/Vector.png', width: 24, height: 24),
          SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter Coupon Code',
                hintStyle: theme.textTheme.bodyMedium,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                border: InputBorder.none,
              ),
              style: theme.textTheme.bodyMedium,
            ),
          ),

          GestureDetector(
            onTap: () {},
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
