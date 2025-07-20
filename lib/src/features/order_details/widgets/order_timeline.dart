import 'package:flutter/material.dart';
import 'package:ecommerce_app/src/features/order_details/models/order_model.dart';
import 'package:intl/intl.dart';

class OrderTimeline extends StatelessWidget {
  final Order order;

  const OrderTimeline({super.key, required this.order});

  final List<String> statuses = const [
    "Delivered",
    "Shipped",
    "Order Confirmed",
    "Order Placed",
  ];

  int getCurrentStatusIndex(String status) {
    return statuses.indexOf(status);
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = getCurrentStatusIndex(order.status);
    final theme = Theme.of(context);
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
                _getDateForStatus(statuses[index]),
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

  String _getDateForStatus(String status) {
    DateTime? date;
    switch (status) {
      case "Order Placed":
        date = order.placedDate;
        break;
      case "Order Confirmed":
        date = order.confirmedDate;
        break;
      case "Shipped":
        date = order.shippedDate;
        break;
      case "Delivered":
        date = order.deliveredDate;
        break;
    }

    if (date == null) return "--";
    return DateFormat("d MMM", 'en_US').format(date);
  }
}
