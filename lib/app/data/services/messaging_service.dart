import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class MessagingService {
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print('Handling a background message ${message.messageId}');
  }

  static final FirebaseMessaging _messaging = FirebaseMessaging.instance;

  static final FlutterLocalNotificationsPlugin _localNotification =
      FlutterLocalNotificationsPlugin();

  static Future<void> _requestPermission() async {
    if (Platform.isAndroid) return;

    await _messaging.requestPermission();
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

  static Stream<RemoteMessage> get onMessage => FirebaseMessaging.onMessage;

  static Stream<RemoteMessage> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp;

  static Future<void> initalize(
      SelectNotificationCallback onSelectNotification) async {
    print(await _messaging.getToken());
    await _initializeLocalNotification(onSelectNotification);
    await _configureAndroidChannel();
    await _openInitialScreenFromMessage(onSelectNotification);
  }

  static void invokeLocalNotification(RemoteMessage remoteMessage) async {
    print("Received notification ${remoteMessage.data}");
    RemoteNotification? notification = remoteMessage.notification;
    AndroidNotification? android = remoteMessage.notification?.android;

    if (notification != null && android != null) {
      await _localNotification.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            "BreakingCodeChannel",
            "High Importance Notifications",
            //"This channel is used for important notifications.",
            icon: android.smallIcon,
          ),
        ),
        payload: jsonEncode(remoteMessage.data),
      );
    }
  }

  static Future<void> _configureAndroidChannel() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      "BreakingCodeChannel",
      "High Importance Notifications",
      description: 'This channel is used for important notifications.',
      importance: Importance.max,
    );
    await _localNotification
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  static Future<void> _openInitialScreenFromMessage(
      SelectNotificationCallback onSelectNotification) async {
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage?.data != null) {
      onSelectNotification(jsonEncode(initialMessage!.data));
    }
  }

  static Future<void> _initializeLocalNotification(
      SelectNotificationCallback onSelectNotification) async {
    final android = AndroidInitializationSettings("@drawable/logo");
    final ios = IOSInitializationSettings();
    final initsetting = InitializationSettings(android: android, iOS: ios);
    await _localNotification.initialize(
      initsetting,
      onSelectNotification: onSelectNotification,
    );
  }
}
