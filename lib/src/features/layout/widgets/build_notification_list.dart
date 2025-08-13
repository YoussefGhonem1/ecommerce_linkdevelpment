
// import 'package:ecommerce_app/src/features/layout/models/notification_model.dart';
// import 'package:ecommerce_app/src/features/layout/widgets/notification_card.dart';
// import 'package:flutter/material.dart';

// class BuildNotificationList extends StatelessWidget {
//   final List<NotificationModel> notifications;

//   const BuildNotificationList({
//     super.key,
//     required this.notifications,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: notifications.length,
//       itemBuilder: (context, index) {
//         return NotificationCard(
//           notification: notifications[index],
//           onTap: () {
            
//           },
//         );
//       },
//     );
//   }
// }
import 'package:ecommerce_app/src/features/layout/models/notification_model.dart';
import 'package:ecommerce_app/src/features/layout/provider/notification_provider.dart';
import 'package:ecommerce_app/src/features/layout/widgets/notification_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


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
          onTap: () {
            ref.read(markAsReadProvider)(notification.id);
          },
          onDoubleTap: () {
            ref.read(deleteNotificationProvider)(notification.id);
          },
          child: NotificationCard(
            notification: notification,
          ),
        );
      },
    );
  }
}
