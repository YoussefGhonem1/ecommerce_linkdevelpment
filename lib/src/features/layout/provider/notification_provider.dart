import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/src/features/layout/models/notification_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final notificationsProvider = StreamProvider<List<NotificationModel>>((ref) {
  return FirebaseFirestore.instance
      .collection('notifications')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => NotificationModel.fromMap(doc.data()))
          .toList());
});

final addNotificationProvider = Provider((ref) {
  return (NotificationModel notification) async {
    await FirebaseFirestore.instance.collection('notifications').add(
          notification.toMap(),
        );
  };
});

final markAsReadProvider = Provider((ref) {
  return (String docId) async {
    await FirebaseFirestore.instance
        .collection('notifications')
        .doc(docId)
        .update({'isRead': true});
  };
});
