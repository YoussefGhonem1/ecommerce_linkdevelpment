import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';

@pragma('vm:entry-point') 
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  await _saveIncomingMessageToFirestore(message);
}

final FlutterLocalNotificationsPlugin localNotifications =
    FlutterLocalNotificationsPlugin();

class FCM {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future<void> fcmInit() async {
    await Firebase.initializeApp();

    const AndroidInitializationSettings initAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings =
        InitializationSettings(android: initAndroid);
    await localNotifications.initialize(initSettings);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await requestPermission();
    await getToken();
    await handleForegroundMessage();
    _handleOnMessageOpenedApp();
  }

  static Future<void> requestPermission() async {
    final settings = await messaging.requestPermission(
      alert: true, badge: true, sound: true,
    );
    print('FCM permission: ${settings.authorizationStatus}');
  }

  static Future<String?> getToken() async {
    try {
      final token = await messaging.getToken();
      print("FCM Token: $token");
      return token;
    } catch (e) {
      print("Error getting FCM token: $e");
      return null;
    }
  }

  static Future<void> handleForegroundMessage() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );

    await localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      final notification = message.notification;
      final android = message.notification?.android;

      if (notification != null && android != null) {
        await localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channelDescription: channel.description,
              icon: '@mipmap/ic_launcher',
              importance: Importance.max,
              priority: Priority.high,
            ),
          ),
        );
      }

      await _saveIncomingMessageToFirestore(message);
    });
  }

  static void _handleOnMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen((message) async {
      await _saveIncomingMessageToFirestore(message);
    });
  }

  static Future<void> showLocalAndSave({
    required String title,
    required String body,
  }) async {
    await localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'high_importance_channel',
          'High Importance Notifications',
          channelDescription: 'This channel is used for important notifications.',
          importance: Importance.max,
          priority: Priority.high,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );

    await _saveIncomingMessageToFirestore(null, title: title, body: body);
  }
}

Future<void> _saveIncomingMessageToFirestore(RemoteMessage? message,
    {String? title, String? body}) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  final String msgTitle = title ?? message?.notification?.title ?? 'No title';
  final String msgBody = body ?? message?.notification?.body ?? 'No body';

  await FirebaseFirestore.instance
      .collection('users')
      .doc(user.uid)
      .collection('notifications')
      .add({
    'title': msgTitle,
    'body': msgBody,
    'isRead': false,
    'createdAt': FieldValue.serverTimestamp(),
    'data': message?.data ?? {},
  });
}
