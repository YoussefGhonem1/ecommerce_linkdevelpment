// import 'package:ecommerce_app/generated/assets.dart';

// class NotificationModel {
//   final String title;
//   final bool isRead;

//   NotificationModel({
//     required this.title,
//     required this.isRead,
//   });

//   String get imagePath =>
//       isRead ? Assets.notificationBingRead : Assets.notificationBingUnread;


// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/generated/assets.dart';

class NotificationModel {
  final String title;
  final String body;
  final bool isRead;
  final DateTime createdAt;

  NotificationModel({
    required this.title,
    required this.body,
    required this.isRead,
    required this.createdAt,
  });

  String get imagePath =>
      isRead ? Assets.notificationBingRead : Assets.notificationBingUnread;

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      title: map['title'] ?? '',
      body: map['body'] ?? '',
      isRead: map['isRead'] ?? false,
      createdAt: (map['createdAt'] != null)
          ? (map['createdAt'] as Timestamp).toDate()
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'body': body,
      'isRead': isRead,
      'createdAt': createdAt,
    };
  }
}

