// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:ecommerce_app/src/features/layout/models/notification_model.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// class NotificationNotifier extends StateNotifier<List<NotificationModel>> {
//   NotificationNotifier() : super([]);

//   final _firestore = FirebaseFirestore.instance;

//   // Future<void> fetchNotifications() async {
//   //   final snapshot = await _firestore
//   //       .collection('notifications')
//   //       .orderBy('createdAt', descending: true)
//   //       .get();

//   //   state = snapshot.docs
//   //       .map((doc) => NotificationModel.fromDocument(doc))
//   //       .toList();
//   // }

//   Future<void> addNotification(String title, String body) async {
//     final docRef = await _firestore.collection('notifications').add({
//       'title': title,
//       'body': body,
//       'isRead': false,
//       'createdAt': DateTime.now(),
//     });

//     final newNotification = NotificationModel(
//       id: docRef.id,
//       title: title,
//       body: body,
//       isRead: false,
//       createdAt: DateTime.now(),
//     );

//     state = [newNotification, ...state];
//   }
// }
// final notificationProvider =
//     StateNotifierProvider<NotificationNotifier, List<NotificationModel>>(
//         (ref) => NotificationNotifier());


