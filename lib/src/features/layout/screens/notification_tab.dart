import 'package:ecommerce_app/src/features/layout/models/notification_model.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_Empty_Notification.dart';
import 'package:ecommerce_app/src/features/layout/widgets/build_notification_list.dart';
import 'package:flutter/material.dart';

class NotificationTab extends StatefulWidget {
  const NotificationTab({super.key});

  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  final List<NotificationModel> notificationList = [
    NotificationModel(title: "Your order has been shipped successfully !", isRead: true),
    NotificationModel(title: "Gilbert, your Order #24568 has been confirmed", isRead: false),
    NotificationModel(title: "Your item is out for delivery", isRead: false),
    NotificationModel(title: "Thank you for shopping. Order #24568 canceled.", isRead: true),
    NotificationModel(title: "Discounts on selected items!", isRead: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        automaticallyImplyLeading: false,
      ),
      body: notificationList.isEmpty
          ? const BuildEmptyNotification()
          : BuildNotificationList(notifications: notificationList),
    );
  }
}
