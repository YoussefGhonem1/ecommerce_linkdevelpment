import 'package:ecommerce_app/generated/assets.dart';

class NotificationModel {
  final String title;
  final bool isRead;

  NotificationModel({
    required this.title,
    required this.isRead,
  });

  String get imagePath =>
      isRead ? Assets.notificationBingRead : Assets.notificationBingUnread;


}
