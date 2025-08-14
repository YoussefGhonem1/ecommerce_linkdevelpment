import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import '../models/notification_model.dart';
import '../provider/notification_provider.dart';
import 'notification_card.dart';

class BuildNotificationList extends ConsumerWidget {
  final List<NotificationModel> notifications;

  const BuildNotificationList({
    super.key,
    required this.notifications,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];

        return GestureDetector(
          onTap: () => ref.read(markAsReadProvider)(notification.id),
          onDoubleTap: () => ref.read(deleteNotificationProvider)(notification.id),
          child: NotificationCard(notification: notification),
        );
      },
    );
  }
}
