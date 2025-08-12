import 'package:ecommerce_app/src/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/l10n/translation/app_localizations.dart';

class CouponCodeCard extends ConsumerWidget {
  const CouponCodeCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset('assets/images/Vector.png', width: 24, height: 24),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: local.enterCouponCode,
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
            onTap: () {
              // TODO: Apply coupon logic
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.primaryColor,
              child: const Icon(
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
