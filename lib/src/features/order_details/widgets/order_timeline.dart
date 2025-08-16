import 'package:ecommerce_app/src/features/layout/models/orders_model.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';

class OrderTimeline extends StatelessWidget {
  final OrdersModel order;

  const OrderTimeline({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final statuses = [
      local.delivered,
      local.shipped,
      local.orderConfirmed,
      local.orderPlaced,
    ];

    final currentIndex = statuses.length - 3;

    return Column(
      children: List.generate(statuses.length, (index) {
        final isActive = index < currentIndex ? false : true;

        return Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                isActive ? Icons.check_circle : Icons.radio_button_unchecked,
                color: isActive ? Colors.deepPurple : Colors.grey,
                size: 24,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  statuses[index],
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color:
                        isActive
                            ? theme.textTheme.bodyMedium?.color
                            : Colors.grey,
                  ),
                ),
              ),
              const Spacer(),
              Text(
                _getDateForStatus(statuses[index], local),
                style: theme.textTheme.bodySmall?.copyWith(
                  color:
                      isActive ? theme.textTheme.bodySmall?.color : Colors.grey,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String _getDateForStatus(String localizedStatus, AppLocalizations local) {
    if (localizedStatus == local.orderPlaced) {
      return "1 Aug";
    } else if (localizedStatus == local.orderConfirmed) {
      return "2 Aug";
    } else if (localizedStatus == local.shipped) {
      return "3 Aug";
    } else if (localizedStatus == local.delivered) {
      return "6 Aug";
    }
    return "--";
  }
}
