import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/features/order_details/models/order_model.dart';
import 'package:ecommerce_app/core/l10n/translation/app_localizations.dart';
import 'package:intl/intl.dart';

class OrderTimeline extends StatelessWidget {
  final Order order;

  const OrderTimeline({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!; // non-nullable
    final theme = Theme.of(context);

    // Localized statuses list
    final statuses = [
      local.delivered,
      local.shipped,
      local.orderConfirmed,
      local.orderPlaced,
    ];

    final currentIndex = getCurrentStatusIndex(order.status, statuses);

    return Column(
      children: List.generate(statuses.length, (index) {
        final isActive = index >= currentIndex;
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

  int getCurrentStatusIndex(String status, List<String> statuses) {
    return statuses.indexOf(status);
  }

  String _getDateForStatus(String localizedStatus, AppLocalizations local) {
    DateTime? date;

    if (localizedStatus == local.orderPlaced) {
      date = order.placedDate;
    } else if (localizedStatus == local.orderConfirmed) {
      date = order.confirmedDate;
    } else if (localizedStatus == local.shipped) {
      date = order.shippedDate;
    } else if (localizedStatus == local.delivered) {
      date = order.deliveredDate;
    }

    if (date == null) return "--";
    return DateFormat("d MMM", 'en_US').format(date);
  }
}
