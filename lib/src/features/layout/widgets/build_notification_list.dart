
import 'package:ecommerce_app/src/features/layout/models/notification_model.dart';
import 'package:ecommerce_app/src/features/layout/widgets/notification_card.dart';
import 'package:flutter/material.dart';

class BuildNotificationList extends StatelessWidget {
  final List<NotificationModel> notifications;

  const BuildNotificationList({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return NotificationCard(
          notification: notifications[index],
          onTap: () {
          },
        );
      },
    );
  }
}
